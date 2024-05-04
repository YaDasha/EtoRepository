//
//  Book.swift
//  NewNew
//
//  Created by Дарья Ксензова on 01.05.2024.
//

import Foundation

struct Book: Decodable {
    let book: String
    let title: String?
    let author: String?
    let condition: String
}
