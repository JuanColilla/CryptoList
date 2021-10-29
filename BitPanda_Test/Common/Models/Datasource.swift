//
//  Datasource.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

struct MasterPayloadFileData: Decodable {
    let data: MasterPayloadData
}

struct MasterPayloadData: Decodable {
    let type: String
    let attributes: MasterData
}

struct MasterData: Decodable {
    let cryptocoins: [Asset]
    let commodities: [Asset]
    let fiats: [Asset]
    let wallets: [Wallet]
    let comoditiesWallets: [Wallet]
    let fialWallets: [Wallet]
    
    enum CodingKeys: String, CodingKey {
        case cryptocoins
        case commodities
        case fiats
        case wallets
        case comoditiesWallets = "commodity_wallets"
        case fialWallets = "fiatwallets"
    }
}

enum AssetType: String, Decodable, CaseIterable {
    case cryptocoin
    case commodity
    case fiat
}
    
struct Asset: Decodable {
    let id: String
    let type: AssetType
    let iconWhite: String
    let iconBlack: String
    let logo: String
    let name: String
    let symbol: String
    let precision: Int
    let hasWallets: Bool?
    let averagePrice: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
    
    enum AttributesKeys: String, CodingKey {
        case logo = "logo"
        case iconWhite = "logo_white"
        case iconBlack = "logo_dark"
        case name
        case symbol
        case averagePrice = "avg_price"
        case precision
        case hasWallets = "has_wallets"
        case presisionForFiat = "precision_for_fiat_price"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        type = try values.decode(AssetType.self, forKey: .type)
        
        let attributes = try values.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        let whiteIcon =  try attributes.decodeIfPresent(String.self, forKey: .iconWhite)
        let blackIcon = try attributes.decodeIfPresent(String.self, forKey: .iconBlack)
        logo = try attributes.decode(String.self, forKey: .logo)
        iconWhite = whiteIcon ?? logo
        iconBlack = blackIcon ?? logo
        name = try attributes.decode(String.self, forKey: .name)
        symbol = try attributes.decode(String.self, forKey: .symbol)
        if let averagePriceString = try attributes.decodeIfPresent(String.self, forKey: .averagePrice) {
            averagePrice = averagePriceString
        } else {
            averagePrice = nil
        }
        let precision1 = try attributes.decodeIfPresent(Int.self, forKey: .precision) ?? 0
        let precision2 = try attributes.decodeIfPresent(Int.self, forKey: .presisionForFiat)
        precision = precision2 ?? precision1
        hasWallets = try attributes.decodeIfPresent(Bool.self, forKey: .hasWallets)
    }
}

enum WalletType: String, Decodable, CaseIterable {
    case wallet
    case fiatWallet = "fiat_wallet"
}

class Wallet: Decodable {
    let id: String
    let type: WalletType
    let name: String
    let symbol: String
    let balance: String
    let isDeleted: Bool
    let isDefault: Bool
    var iconWhite: String?
    var iconBlack: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
    
    enum AttributesKeys: String, CodingKey {
        case name
        case symbol = "cryptocoin_symbol"
        case fiatSymbol = "fiat_symbol"
        case balance
        case isDeleted = "deleted"
        case isDefault = "is_default"
        case iconWhite
        case iconBlack
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        type = try values.decode(WalletType.self, forKey: .type)
        let attributes = try values.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        name = try attributes.decode(String.self, forKey: .name)
        let symbolStr = try attributes.decodeIfPresent(String.self, forKey: .symbol)
        let fiatSymbolStr = try attributes.decodeIfPresent(String.self, forKey: .fiatSymbol)
        symbol = symbolStr ?? fiatSymbolStr ?? ""
        let balanceString = try attributes.decodeIfPresent(String.self, forKey: .balance) ?? ""
        balance = balanceString
        isDeleted = try attributes.decodeIfPresent(Bool.self, forKey: .isDeleted) ?? false
        isDefault = try attributes.decodeIfPresent(Bool.self, forKey: .isDefault) ?? false
        iconWhite = nil
        iconBlack = nil
    }
}

extension MasterData {
    static let empty = MasterData(cryptocoins: [], commodities: [], fiats: [], wallets: [], comoditiesWallets: [], fialWallets: [])
}
