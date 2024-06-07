//
//  CacheRadio.swift
//  Radio
//
//  Created by Anda on 5.06.2024.
//

import Foundation

struct CacheRadio: Codable {
    var name: String
    var url: String
    var image: String
    
    init(name: String, url: String, image: String) {
        self.name = name
        self.url = url
        self.image = image
    }

}
