//
//  ArticleViewModel.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
protocol ArticleViewModelProtocol {
    var title: String { get }
    var author: String { get }
}
struct ArticleViewModel: ArticleViewModelProtocol {
    var title: String
    var author: String
    init(article: Article) {
        self.title = article.title
        if let author = article.author {
            self.author = author
        } else {
            self.author = "No Author"
        }
    }
}
extension ArticleViewModel: Equatable {
    static func == (lhs: ArticleViewModel, rhs: ArticleViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author
    }
}
