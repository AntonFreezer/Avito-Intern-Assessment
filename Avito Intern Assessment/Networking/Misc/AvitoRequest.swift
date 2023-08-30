//
//  AvitoRequest.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 30.08.2023.
//

import Foundation

final class AvitoRequest {
    
    private struct Constants {
        static let baseURL = "https://www.avito.st/s/interns-ios"
    }
    
    public let httpMethod = "GET"
    private let endpoint: AvitoEndpoint
    
    /// Path components '/' for request, if present
    private let pathComponents: [String]
    /// Query parameters '?...&...&' for request, if present
    private let queryParameters: [URLQueryItem]
    
    /// String URL constructed for the request
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.stringValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed property for constructing request URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// General initializer for customizable API request
    public init(
        endpoint: AvitoEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension AvitoRequest {
    /// predefined API request for all advertisements
    static let allAdvertisementsRequest = AvitoRequest(endpoint: .mainPage)
    /// predefined API request for an advertisement in details
    static func advertisementDetailsRequest(for detailId: Int) -> AvitoRequest {
        AvitoRequest(endpoint: .details(itemId: String(detailId)))
    }
    /// predefined API request for an image in advertisement
    static func advertisementImageRequest(for detailId: Int) -> AvitoRequest {
        AvitoRequest(endpoint: .images(imageId: String(detailId)))
    }
}
