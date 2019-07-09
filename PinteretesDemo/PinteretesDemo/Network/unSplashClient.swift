//
//  unSplashClient.swift
//  PinteretesDemo
//
//  Created by Pratik Bhaliya on 8/7/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = "406b3136aad5f6309687807b9a29f3c626622359a3d37b7d4287ddaeb4b158fe"
    
    func fetch(with endpoint: UnsplashEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        let request =  endpoint.request
        get(with: request, completion: completion)
    }
}

