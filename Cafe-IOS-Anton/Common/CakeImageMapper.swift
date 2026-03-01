//
//  CakeImageMapper.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 01.03.2026.
//

import UIKit

struct CakeImageMapper {
    private static let map: [String: UIImage] = {
        var result = [String: UIImage]()
        
        let cakes: [(image: UIImage, keys: [String])] = [
            (Shark.I.bananVKarameli, ["BananVKarameli", "Банан в карамели", "банан в карамели"]),
            (Shark.I.bananovyyToffi, ["BananovyyToffi", "Банановый тоффи", "банановый тоффи"]),
            (Shark.I.chizkeyk, ["Chizkeyk", "Чизкейк", "чизкейк"]),
            (Shark.I.ferreroRocher, ["FerreroRocher", "Ферреро Роше", "ферреро роше"]),
            (Shark.I.fistashkaMalina, ["FistashkaMalina", "Фисташка малина", "фисташка малина"]),
            (Shark.I.fistashkaVishnya, ["FistashkaVishnya", "Фисташка вишня", "фисташка вишня"]),
            (Shark.I.fundukKaramel, ["FundukKaramel", "Фундук карамель", "фундук карамель"]),
            (Shark.I.golubichnyy, ["Golubichnyy", "Голубичный", "голубичный"]),
            (Shark.I.grushaMinal, ["GrushaMinal", "Груша миндаль", "груша миндаль"]),
            (Shark.I.klubnikaBanan, ["KlubnikaBanan", "Клубника банан", "клубника банан"]),
            (Shark.I.klubnikaShokolad, ["KlubnikaShokolad", "Клубника шоколад", "клубника шоколад"]),
            (Shark.I.kokosovyy, ["Kokosovyy", "Кокосовый", "кокосовый"]),
            (Shark.I.malinovyy, ["Malinovyy", "Малиновый", "малиновый"]),
            (Shark.I.malinovyyMilksheyk, ["MalinovyyMilksheyk", "Малиновый милкшейк", "малиновый милкшейк"]),
            (Shark.I.mangoMarakuya, ["MangoMarakuya", "Манго маракуйя", "манго маракуйя"]),
            (Shark.I.morkovnyySKaramelyu, ["MorkovnyySKaramelyu", "Морковный с карамелью", "морковный с карамелью"]),
            (Shark.I.mussovyyShokoladnyyBento, ["MussovyyShokoladnyyBento", "Муссовый шоколадный бенто", "муссовый шоколадный бенто"]),
            (Shark.I.mussovyyYagodnyyBento, ["MussovyyYagodnyyBento", "Муссовый ягодный бенто", "муссовый ягодный бенто"]),
            (Shark.I.persikMalina, ["PersikMalina", "Персик малина", "персик малина"]),
            (Shark.I.poleznyyMedovik, ["PoleznyyMedovik", "Полезный медовик", "полезный медовик"]),
            (Shark.I.praga, ["Praga", "Прага", "прага"]),
            (Shark.I.raffaello, ["Raffaello", "Рафаэлло", "рафаэлло"]),
            (Shark.I.snikersClassic, ["SnikersClassic", "Сникерс классик", "сникерс классик"]),
            (Shark.I.tiramisu, ["Tiramisu", "Тирамису", "тирамису"]),
            (Shark.I.triShokoladaMussovyy, ["TriShokoladaMussovyy", "Три шоколада муссовый", "три шоколада муссовый"]),
            (Shark.I.tropiki, ["Tropiki", "Тропики", "тропики"]),
            (Shark.I.tykvennyyLatte, ["TykvennyyLatte", "Тыквенный латте", "тыквенный латте"]),
            (Shark.I.vishnyaShokolad, ["VishnyaShokolad", "Вишня шоколад", "вишня шоколад"]),
            (Shark.I.vishnyaVShokolade, ["VishnyaVShokolade", "Вишня в шоколаде", "вишня в шоколаде"]),
            (Shark.I.yablokoKoritsa, ["YablokoKoritsa", "Яблоко корица", "яблоко корица"]),
            (Shark.I.yagodnyyBarhat, ["YagodnyyBarhat", "Ягодный бархат", "ягодный бархат"]),
            (Shark.I.golubikaVanil, ["golubikaVanil", "Голубика ваниль", "голубика ваниль"]),
            (Shark.I.klubnikaVShocolade, ["klubnikaVShocolade", "Клубника в шоколаде", "клубника в шоколаде"]),
            (Shark.I.medovik, ["medovik", "Медовик", "медовик"]),
            (Shark.I.snikers, ["snikers", "Сникерс", "сникерс"]),
        ]
        
        for cake in cakes {
            for key in cake.keys {
                result[key.lowercased()] = cake.image
            }
        }
        
        return result
    }()
    
    static func image(for cakeName: String) -> UIImage? {
        return map[cakeName.lowercased()]
    }
}
