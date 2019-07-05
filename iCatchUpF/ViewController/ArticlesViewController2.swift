//
//  ArticlesViewController.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/4/19.
//  Copyright © 2019 final. All rights reserved.
//

import UIKit
import os

private let reuseIdentifier = "Cell"

class ArticleCell: UICollectionViewCell {
    
    var article: Article?
    
    func update(from article: Article) {
        self.article = article
        if let urlString = article.urlToImage {
            self.pictureImageView.setImage(
                fromUrlString: urlString,
                withDefaultImage: "no-image-available",
                withErrorImage: "no-image-available")
        }
        self.titleLabel.text = article.title
    }
}

class ArticlesViewController: UICollectionViewController {
    var articles: [Article] = [Article]()
    var currentRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    func updateData() {
        NewsApi.getTopHeadlines(responseHandler: handleResponse,
                                errorHandler: handleError)
    }
    
    func handleResponse(response: ArticlesResponse) {
        guard let articles = response.articles else {
            self.articles = [Article]()
            return
        }
        self.articles = articles
        print(self.articles)
        self.collectionView.reloadData()
    }
    
    func handleError(error: Error) {
        let message = "Error while requesting Articles:\(error.localizedDescription)"
        os_log("%@", message)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        // Configure the cell
        cell.update(from: articles[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        performSegue(withIdentifier: "showArticle", sender: self)
    }
}
