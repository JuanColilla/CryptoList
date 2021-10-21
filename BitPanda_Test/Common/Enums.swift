//
//  Enums.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

enum AssetGroupName: String, Codable {
    case coin = "coin"
    case metal = "metal"
}

enum AssetTypeNameEnum: String, Codable {
    case commodity = "commodity"
    case cryptocoin = "cryptocoin"
}

enum Family: String, Codable {
    case eth = "ETH"
    case neo = "NEO"
}

enum IosSupportedVersion: String, Codable {
    case the100 = "1.0.0"
    case the101 = "1.0.1"
}

enum CommodityWalletType: String, Codable {
    case wallet = "wallet"
}
