//
//  ViewController.swift
//  PagingTableView
//
//  Created by Diego Caridei on 31/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import UIKit
enum Constant {
    static let cellID = "newsCell"
    static let maxPage = 499
    static let loadingCell = "loading"
}
class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articlesVM = [ArticleViewModel]()
    private var currentPage = 1
    private var shouldShowLoadingCell = false
    override func viewDidLoad() {
        super.viewDidLoad()
        laodNews()
    }
    fileprivate func laodNews() {
        DataProvider.fetchNews(with: "Create application", page: currentPage) { [weak self] (articles) in
            guard let strongSelf = self else {return}
            (articles).forEach({ (article) in
                if !strongSelf.articlesVM.contains(article) {
                    strongSelf.articlesVM.append(contentsOf: articles)
                }
            })
            strongSelf.shouldShowLoadingCell = strongSelf.currentPage < Constant.maxPage
            strongSelf.tableView.reloadData()
        }
    }
    private func fetchNextPage() {
        currentPage += 1
        laodNews()
    }
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count =  articlesVM.count
        return shouldShowLoadingCell ? count + 1 : count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoadingIndexPath(indexPath: indexPath) {
            return LoadingCell(style: .default, reuseIdentifier: Constant.loadingCell)
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellID, for: indexPath) as? NewsTableViewCell else {
            fatalError("Error ")
        }
        cell.setCell(with: articlesVM[indexPath.row])
        return cell
    }
    private func isLoadingIndexPath(indexPath: IndexPath ) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == articlesVM.count
    }
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard isLoadingIndexPath(indexPath: indexPath) else { return }
        fetchNextPage()
    }
}
