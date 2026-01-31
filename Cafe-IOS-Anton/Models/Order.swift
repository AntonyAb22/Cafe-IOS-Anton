//
//  Order.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 24.01.2026.
//

struct OrdersList: Codable {
    let list: [Order]
    let total: Int  //  коли - во заказов
}

struct Order: Codable {
    let id: String
    let cakeName: String // наименование продукта
    let count: Int // Кол-во продуктов
    let totalPrice: Int // сумма заказа
    let time: String // время осущ заказа
    let address: String // адрес доставки
    let payment: Payment // способ оплаты
    let deliveryDate: String // дата доставки
}

enum Payment: String, Codable {
    case card, cash
}
