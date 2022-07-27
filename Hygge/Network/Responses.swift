//
//  Responses.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 21.05.2022.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    
    let status: String?
    let statusCode: Int?
    let message: String?
    let result: T?
}

struct Product: Decodable {
    let id: Int?
    let productName: String?
    let oldPrice: Double?
    let newPrice: Double?
    let type: String?
    let productImage: String?
    let quantity: Int?
}

struct CustomError: Error {
    let message: String
}

struct CartReponse: Decodable {
    let id: Int?
    let token: String?
    let products: [Product]?
}
