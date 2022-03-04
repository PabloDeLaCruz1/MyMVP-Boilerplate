//
//  User.swift
//  My-MVP-Skeleton
//
//  Created by Pablo De La Cruz on 3/3/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressData
    let phone: String
    let website: String
    let company: CompanyData
}

struct AddressData: Codable{
    let street: String
    let suite : String
    let city : String
    let zipcode : String
    let geo : GeoData
}

struct GeoData: Codable {
    let lat : String
    let lng : String
    
}
struct CompanyData: Codable{
    let name: String
    let catchPhrase : String
    let bs : String
}
