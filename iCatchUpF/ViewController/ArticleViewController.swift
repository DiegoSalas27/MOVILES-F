//
//  ArticleViewController.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/5/19.
//  Copyright © 2019 final. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    var article: Article?
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if  let article = article,
            let urlToImage = article.urlToImage,
            let pictureImageView = pictureImageView,
            let titleLabel = titleLabel,
            let descriptionLabel = descriptionLabel,
            let contentLabel = contentLabel {
            pictureImageView.setImage(
                fromUrlString: urlToImage,
                withDefaultImage: "no-image-available",
                withErrorImage: "no-image-available")
            titleLabel.text = article.title
            descriptionLabel.text = article.description
            contentLabel.text = article.content
        }
    }
}
