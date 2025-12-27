//
//  KeyChain.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation
import Security

class KeyChain {

    static let instance = KeyChain()

    // MARK: - Public
    func loadToken() -> String? {
        string(forKey: authKey)
    }

    func loadRefreshToken() -> String? {
        string(forKey: refreshKey)
    }

    @discardableResult func removeToken() -> Bool {
        remove(forKey: authKey) && remove(forKey: refreshKey)
    }

    @discardableResult func saveToken(_ token: String) -> Bool {
        set(token, forKey: authKey)
    }

    @discardableResult func saveRefreshToken(_ token: String) -> Bool {
        set(token, forKey: refreshKey)
    }

    func string(forKey key: String) -> String? {
        guard let keychainData = data(forKey: key) else { return nil }
        return String(data: keychainData, encoding: String.Encoding.utf8) as String?
    }

    func data(forKey key: String) -> Data? {
        var keychainQueryDictionary = setupKeychainQueryDictionary(forKey: key)
        keychainQueryDictionary[secMatchLimit] = kSecMatchLimitOne
        keychainQueryDictionary[secReturnData] = kCFBooleanTrue
        var result: AnyObject?
        let status = SecItemCopyMatching(keychainQueryDictionary as CFDictionary, &result)

        return status == noErr ? result as? Data : nil
    }

    func set(_ value: String, forKey key: String) -> Bool {
        if let data = value.data(using: .utf8) {
            return set(data, forKey: key)
        } else {
            return false
        }
    }

    // MARK: - Init
    private init() {}

    // MARK: - Private constant
    private let secMatchLimit: String!  = kSecMatchLimit as String
    private let secReturnData: String!  = kSecReturnData as String
    private let secAttrService: String! = kSecAttrService as String
    private let secAttrGeneric: String! = kSecAttrGeneric as String
    private let secAttrAccount: String! = kSecAttrAccount as String
    private let secValueData: String!   = kSecValueData as String
    private let secClass: String!       = kSecClass as String
    private let authKey                 = "authToken"
    private let refreshKey              = "refreshToken"
}

// MARK: - Private method
private extension KeyChain {

    func update(_ value: Data, forKey key: String) -> Bool {
        let keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key)
        let updateDictionary = [secValueData:value]
        let status: OSStatus = SecItemUpdate(keychainQueryDictionary as CFDictionary, updateDictionary as CFDictionary)
        return status == errSecSuccess
    }

    func setupKeychainQueryDictionary(forKey key: String) -> [String: Any] {
        var keychainQueryDictionary: [String: Any] = [secClass:kSecClassGenericPassword]
        keychainQueryDictionary[secAttrService] = Bundle.main.bundleIdentifier

        let encodedIdentifier: Data? = key.data(using: String.Encoding.utf8)

        keychainQueryDictionary[secAttrGeneric] = encodedIdentifier

        keychainQueryDictionary[secAttrAccount] = encodedIdentifier

        return keychainQueryDictionary
    }

    func set(_ value: Data, forKey key: String) -> Bool {
        var keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key)

        keychainQueryDictionary[secValueData] = value

        let status: OSStatus = SecItemAdd(keychainQueryDictionary as CFDictionary, nil)

        if status == errSecSuccess {
            return true
        } else if status == errSecDuplicateItem {
            return update(value, forKey: key)
        } else {
            return false
        }
    }

    func remove(forKey key: String) -> Bool {
        let keychainQueryDictionary: [String: Any] = setupKeychainQueryDictionary(forKey: key)
        let status: OSStatus = SecItemDelete(keychainQueryDictionary as CFDictionary)
        return status == errSecSuccess
    }
}
