//
//  News.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let news = try News(json)

import Foundation
struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title, description, url: String
    let urlToImage: String?
    let publishedAt: String
}
struct Source: Codable {
    let id: String?
    let name: String
}

// MARK: Convenience initializers

extension News {
    init(data: Data) throws {
        self = try JSONDecoder().decode(News.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Article {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Article.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Source {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Source.self, from: data)
    }
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
