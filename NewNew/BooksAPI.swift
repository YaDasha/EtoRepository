//
//  BooksAPI.swift
//  NewNew
//
//  Created by Дарья Ксензова on 30.04.2024.
//

import Moya
import Foundation

enum BooksAPI {
    case getBooks
}

extension BooksAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://demo.api-platform.com")!
    }
    
    var path: String {
        switch self {
        case .getBooks:
            return "/books"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBooks:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getBooks:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["accept": "application/json"]
    }
}

