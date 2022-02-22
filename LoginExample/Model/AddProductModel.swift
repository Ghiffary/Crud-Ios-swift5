//
//  AddProductModel.swift
//  LoginExample
//
//  Created by MacBook Air on 20/02/22.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import Foundation

struct AddProductModel: Encodable {
    let title: String
    let content: String
    
}

struct RespnseAddProduct: Codable {
    
    let id: Int
    let title: String
    let content: String
    
    
    
}
