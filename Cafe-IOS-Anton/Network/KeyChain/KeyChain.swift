
import Foundation
import Security

final class KeyChain {
    
    static let shared = KeyChain()
    
    private let accessTokenKey = "access"
    private let refreshTokenKey = "refresh"
    
    // MARK: - Public Methods
    func saveAccessToken(_ token: String) -> Bool {
        save(token, forKey: accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        loadString(forKey: accessTokenKey)
    }
    
    func saveRefreshToken(_ token: String) -> Bool {
        save(token, forKey: refreshTokenKey)
    }
    
    func getRefreshToken() -> String? {
        loadString(forKey: refreshTokenKey)
    }
    
    func clearTokens() -> Bool {
        remove(forKey: accessTokenKey) && remove(forKey: refreshTokenKey)
    }
    
    // MARK: - Diagnostic
    func checkKeyChain() {
        print("🔍 Проверка KeyChain:")
        
        let accessToken = getAccessToken()
        let refreshToken = getRefreshToken()
        
        print("   Access token: \(accessToken != nil ? "✅ есть" : "❌ нет")")
        if let token = accessToken {
            print("   Access token (первые 20 символов): \(token.prefix(20))...")
        }
        print("   Refresh token: \(refreshToken != nil ? "✅ есть" : "❌ нет")")
        if let token = refreshToken {
            print("   Refresh token (первые 20 символов): \(token.prefix(20))...")
        }
    }
    
    // MARK: - Private
    private init() {}
    
    private func save(_ string: String, forKey key: String) -> Bool {
        guard let data = string.data(using: .utf8) else {
            print("❌ Ошибка конвертации строки в Data для ключа: \(key)")
            return false
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock // ВАЖНО!
        ]
        
        // Удаляем старое значение
        SecItemDelete(query as CFDictionary)
        
        // Сохраняем новое
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("✅ Токен сохранен в KeyChain для ключа: \(key)")
            return true
        } else {
            print("❌ Ошибка сохранения токена в KeyChain для ключа: \(key), статус: \(status)")
            return false
        }
    }
    
    private func loadString(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            if let data = result as? Data, let string = String(data: data, encoding: .utf8) {
                print("✅ Токен загружен из KeyChain для ключа: \(key)")
                return string
            } else {
                print("❌ Ошибка преобразования данных для ключа: \(key)")
                return nil
            }
        } else if status == errSecItemNotFound {
            print("⚠️ Токен не найден в KeyChain для ключа: \(key)")
            return nil
        } else {
            print("❌ Ошибка загрузки из KeyChain для ключа: \(key), статус: \(status)")
            return nil
        }
    }
    
    private func remove(forKey key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status == errSecSuccess || status == errSecItemNotFound {
            print("✅ Токен удален из KeyChain для ключа: \(key)")
            return true
        } else {
            print("❌ Ошибка удаления из KeyChain для ключа: \(key), статус: \(status)")
            return false
        }
    }
}
