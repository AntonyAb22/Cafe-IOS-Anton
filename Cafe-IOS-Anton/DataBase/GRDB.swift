//
//  GRDB.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 18.01.2026.
//

import Foundation
import GRDB

class GRDBDatabase {
    private var dbQueue: DatabaseQueue?
    
    init() {
        do {
            try openDatabase()
            // дописать остальные сущности
        } catch {
            print("Ощибка при инициализация базы данных: \(error)")
        }
    }
    
    private func openDatabase() throws {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("database.sqlite")
        
        dbQueue = try DatabaseQueue(path: fileURL.path)
        
    }
}

// ошибки базы данных
enum DatabaseError: Error {
    case databaseNotInitialized
}
