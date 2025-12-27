//
//  MultipartRequestPartType.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public protocol MultipartRequestPartType {
    var name: String { get }
    var partData: Data { get }
}

