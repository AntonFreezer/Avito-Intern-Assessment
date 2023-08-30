//
//  AvitoServiceError.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 30.08.2023.
//

@frozen enum AvitoServiceError: Error {
    case failedToCreateRequest
    case failedToGetData
}
