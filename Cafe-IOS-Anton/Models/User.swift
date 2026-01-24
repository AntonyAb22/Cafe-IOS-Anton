//
//  User.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 24.01.2026.
//

import GRDB
import Foundation

struct UserList: Codable {
    let items: [User]
    let total: Int?
}

struct User: Codable, FetchableRecord, PersistableRecord {
    let id: String?
    let email: String?
    let phoneNumber: String
    let password: String
    let firstName: String
    let lastName: String
    let avatarName: String
    
    static let databaseTableName = "users"
    
    enum Columns: String, ColumnExpression {
        case id, email, phoneNumber, password, firstName, lastName, avatarName
    }
    
    // инициализатор для создания юзера вручную
    init(
        id: String? = nil,
        email: String? = nil,
        phoneNumber: String,
        password: String,
        firstName: String,
        lastName: String,
        avatarName: String) {
            
        self.id = id
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.avatarName = avatarName
    }
    
    // Инициализатор для декодирования из JSON (API)
    
    //Инициализатор для GRDB (из строки базы данных )
    
    // кодирование для GRDB
    
    // Конвертация в основную модель User
    func toUser() -> User {
        return User(
            id: id,
            email: email,
            phoneNumber: phoneNumber,
            password: password,
            firstName: firstName ?? "",
            lastName: lastName ?? "",
            avatarName: avatarName
        )
    }
    
}
