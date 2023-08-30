//
//  AvitoServiceImpl.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 31.08.2023.
//

import Foundation

final class AvitoServiceImpl: AvitoService {
    
    static let shared = AvitoServiceImpl()
    
    private init() {}
    
    /// Service method for fetching API data with provided request and data types
    /// - Parameters:
    ///   - request: request with AvitoRequest type
    ///   - dataType: the data type from existing data models
    ///   - completion: the returned data in the Result wrapper
    public func execute<T:Codable>(
        _ request: AvitoRequest,
        expecting dataType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(AvitoServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? AvitoServiceError.failedToGetData))
                return
            }

            do {
                let result = try JSONDecoder().decode(dataType.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    //MARK: - Private
    private func request(from apiRequest: AvitoRequest) -> URLRequest? {
        guard let url = apiRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        return request
    }
}

