//
//  EndPoint.swift
//  PinteretesDemo
//
//  Created by Pratik Bhaliya on 8/7/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation

protocol EndPoint {
    var baseUrl: String {get}
    var path: String {get}
    var urlParameter: [URLQueryItem] {get}
}

extension EndPoint {
    var urlComponent: URLComponents {
        var urlComponent = URLComponents(string: baseUrl)
        urlComponent?.path = path
        urlComponent?.queryItems = urlParameter
        return urlComponent!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum Order: String {
    case popular, latest, oldest
}

enum UnsplashEndpoint: EndPoint {
    case photos(id: String, order: Order, perPage: Int)
    
    var baseUrl: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var urlParameter: [URLQueryItem] {
        switch self {
        case .photos(let id, let order, let perPage):
            return [URLQueryItem(name: "client_id", value: id),
                URLQueryItem(name: "order_by", value: order.rawValue),
                URLQueryItem(name: "per_page", value: String(perPage))
            ]
        }
    }
    
    
}
