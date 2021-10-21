//
//  Fiat.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let fiat = try? newJSONDecoder().decode(Fiat.self, from: jsonData)
//   let fiatAttributes = try? newJSONDecoder().decode(FiatAttributes.self, from: jsonData)

import Foundation

// MARK: - Fiat
struct Fiat: Codable {
    let type: String?
    let attributes: FiatAttributes?
    let id: String?
}

// MARK: - FiatAttributes
struct FiatAttributes: Codable {
    let symbol, name: String?
    let precision: Int?
    let toEurRate, defaultSellAmount, numericCharacterReference, minWithdrawEuro: String?
    let symbolCharacter: String?
    let hasWallets: Bool?
    let logo, logoDark, logoWhite, logoColor: String?
    let nameDeu, nameEng, nameFra: String?

    enum CodingKeys: String, CodingKey {
        case symbol, name, precision
        case toEurRate = "to_eur_rate"
        case defaultSellAmount = "default_sell_amount"
        case numericCharacterReference = "numeric_character_reference"
        case minWithdrawEuro = "min_withdraw_euro"
        case symbolCharacter = "symbol_character"
        case hasWallets = "has_wallets"
        case logo
        case logoDark = "logo_dark"
        case logoWhite = "logo_white"
        case logoColor = "logo_color"
        case nameDeu = "name_deu"
        case nameEng = "name_eng"
        case nameFra = "name_fra"
    }
}


