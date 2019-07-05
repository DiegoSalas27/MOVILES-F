//
//  FavoritesViewController.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/5/19.
//  Copyright © 2019 final. All rights reserved.
//

import Foundation
import UIKit
import os

class FavoritesViewController: ArticlesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isRestrictedToFavorites = true
    }
}
