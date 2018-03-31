//
//  DataProvider.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
class DataProvider {
    static func fetchNews(with elementToSearch: String, page: Int, completition:@escaping(([ArticleViewModel]) -> Void)) {
        var articlesViewModel = [ArticleViewModel]()
        APINews.shared.getNews(with: elementToSearch, page: page) { (result) in
            switch result {
            case .success(let news):
                (news.articles).forEach({ (article) in
                    articlesViewModel.append(ArticleViewModel(article: article))
                })
                completition(articlesViewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
