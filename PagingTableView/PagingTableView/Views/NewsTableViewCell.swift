//
//  NewsTableViewCell.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import UIKit
class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    func setCell(with article: ArticleViewModel) {
        self.titleLabel.text = article.title
        self.authorLabel.text = article.author
    }
}
