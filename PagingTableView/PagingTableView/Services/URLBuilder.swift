//
//  URLBuilder.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
import Alamofire
import Keys
class URLBuilder {
    let baseURL = "https://newsapi.org"
    func allNewsURL( ) -> URL? {
        return URL(string: baseURL)?
            .appendingPathComponent("v2")
            .appendingPathComponent("everything")
    }
    func setParameter(with elment: String = "bitcoin", page: Int = 1) -> Parameters? {
        return  [
            "q": elment,
            "page": page,
            "apiKey": PagingTableViewKeys().newsAPIKey
        ]
    }
}
