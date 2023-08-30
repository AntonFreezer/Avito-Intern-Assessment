//
//  AvitoService.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 31.08.2023.
//

protocol AvitoService: AnyObject {
    func execute<T:Codable>(
        _ request: AvitoRequest,
        expecting dataType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
