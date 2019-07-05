//
//  SourcesResponse.swift
//  iCatchUpF
//
//  Created by Diego Salas Noain on 7/4/19.
//  Copyright © 2019 final. All rights reserved.
//

import Foundation

struct SourcesResponse: Codable {
    var status: String
    var code: String?
    var message: String?
    var sources: [Source]?
}
