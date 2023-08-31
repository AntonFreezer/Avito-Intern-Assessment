//
//  Advertisement.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 31.08.2023.
//

import Foundation

struct Advertisement: Codable {
    let id, title, price, location: String
    let imageURL: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
}
