//
//  UnSplashImage.swift
//  PinteretesDemo
//
//  Created by Pratik Bhaliya on 8/7/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation

typealias Photos  = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
