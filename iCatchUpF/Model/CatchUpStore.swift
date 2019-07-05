//
//  CatchUpStore.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/4/19.
//  Copyright © 2019 final. All rights reserved.
//

import Foundation

class CatchUpStore {
    private let favoritesEntity = FavoritesEntity()
    static let shared = CatchUpStore()
    private init() {}
    
    func isFavorite(source: Source) -> Bool {
        return favoritesEntity.isFavorite(source: source)
    }
    
    func setFavorite(_ isFavorite: Bool, for source: Source) {
        if isFavorite == favoritesEntity.isFavorite(source: source) {
            return
        }
        if isFavorite {
            favoritesEntity.add(from: source)
        } else {
            favoritesEntity.delete(for: source)
        }
    }
    
    func sourceIdsAsString() -> String? {
        return favoritesEntity.sourceIdsAsString()
    }
}
