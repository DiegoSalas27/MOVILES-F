//
//  LogoApi.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/4/19.
//  Copyright © 2019 final. All rights reserved.
//

import Foundation

class LogoApi {
    static let baseUrl = "https://logo.clearbit.com/"
    
    static func urlToLogo(fromSource source: Source) -> String {
        guard let url = URL(string: source.url!), let domain = url.host else {
            return "\(baseUrl)\(source.url!)"
        }
        return "\(baseUrl)\(domain)"
    }
}
