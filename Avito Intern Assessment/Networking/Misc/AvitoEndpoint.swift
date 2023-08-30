//
//  AvitoEndpoint.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 30.08.2023.
//

@frozen enum AvitoEndpoint {
    case mainPage
    case images(imageId: String)
    case details(itemId: String)
    
    var stringValue: String {
        switch self {
        case .mainPage:
            return "main-page.json"
        case .images(imageId: let imageId):
            return "images/\(imageId).png"
        case .details(let itemId):
            return "details/\(itemId).json"
        }
    }
}
