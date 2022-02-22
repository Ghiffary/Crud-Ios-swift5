//
//  DeleteModel.swift
//  LoginExample
//
//  Created by MacBook Air on 20/02/22.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import Foundation

struct DeleteModel: Encodable{
    
    let title: String
    let content: String
}

struct ResponseDeleteModel: Codable {

    let id: Int
    let title: String
    let content: String
//    let createdAt: String
//    let updatedAt: String

    
}
