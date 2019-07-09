//
//  ReviewService.swift
//  Request a Review
//
//  Created by Pratik Bhaliya on 1/5/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation
import StoreKit
import UIKit

class ReviewService {
    
    private init() {}
    static let shared = ReviewService()

    private let defualts = UserDefaults.standard
    private let app = UIApplication.shared
    private var lastRequest:Date? {
        get{
            return defualts.value(forKey: "ReviewService.lastRequest") as? Date
        }
        set{
            return defualts.set(newValue, forKey: "ReviewService.lastRequest")
        }
    }
    
    private var fourMonthAgo:Date {
        return Calendar.current.date(byAdding: .day,value: -120, to: Date())!
    }
    
    private var shoudlRequestReview:Bool {
        if lastRequest == nil {
            return true
        }else if let lastRequest = self.lastRequest, lastRequest < fourMonthAgo {
            return true
        }
        return false
    }
    
    
    private let productURL = URL(string: "https://itunes.apple.com/us/app/id970431542")!

    func writeReview() {
    
        let bundleVersionKey = kCFBundleVersionKey as String
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: bundleVersionKey) as? String
        let lastVersion = defualts.string(forKey: "lastReviewRequestAppVersion")
        
        guard lastVersion == nil || lastVersion !=  currentVersion else {
            return
        }
        
        var component = URLComponents(url: productURL, resolvingAgainstBaseURL: false)
        
        component?.queryItems = [URLQueryItem(name: "action", value: "write-review")]
        
        guard let writeReviewURL = component?.url else {
            return
        }
        
        UIApplication.shared.open(writeReviewURL)
        lastRequest = Date()
        
        defualts.set(currentVersion, forKey: "lastReviewRequestAppVersion")
    }
}
