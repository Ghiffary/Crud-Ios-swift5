//
//  SearchModel.swift
//  LoginExample
//
//  Created by MacBook Air on 20/02/22.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import Foundation

struct SearchModel: Decodable{
    var id: Int?
    var title: String?
    var content: String?
//    let sku: String
    
}

struct ResponseSearchModel: Codable {
//    let id: Int
    let sku: String
//    let productName: String
//    let qty: String
//    let price: Int
//    let unit: String
//    let status: Int
//    let createdAt: String
//    let updatedAt: String

    
}
