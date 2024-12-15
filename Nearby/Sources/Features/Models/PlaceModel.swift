//
//  PlaceModel.swift
//  Nearby
//
//  Created by Dyan silva on 12/10/24.
//

struct Place: Decodable {
    let id: String
    let name: String
    let description: String
    let coupons: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let phone: String
    let cover: String
    let categoryId: String
}
