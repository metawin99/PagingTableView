//
//  APINews.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
import Alamofire
class APINews {
    private let urlBuilder = URLBuilder()
    static let shared = APINews()
    private init() { }
    private  func fetchNews<T>(data: Data, completion: @escaping (DCResult<T>) -> Void ) {
        do {
            let news = try News(data: data)
            guard let result  = DCResult.success(news) as? DCResult<T> else {return}
            completion(result)
        } catch {
            completion(DCResult.failure(error))
        }
    }
    public func getNews(with elementToSearch: String, page: Int, completion: @escaping (DCResult<News>) -> Void) {
        request(with: elementToSearch, page: page, completion: completion)
    }
    private func request <T> (with element: String, page: Int, completion: @escaping (DCResult<T>) -> Void) {
        guard let url = urlBuilder.allNewsURL() else { return }
        guard let parameter = urlBuilder.setParameter(with: element, page: page) else { return }
        Alamofire.request(url, method: .get, parameters: parameter).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                guard let dataResponse = response.data else { return }
                self.fetchNews(data: dataResponse, completion: completion)
            case .failure(let error):
                completion(DCResult.failure(error))
            }
        }
    }
}
