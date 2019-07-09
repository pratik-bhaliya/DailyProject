//
//  ReviewRequestViewController.swift
//  Request a Review
//
//  Created by Pratik Bhaliya on 1/5/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class ReviewRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func badReviewAction(_ sender: Any) {
    }
    @IBAction func goodReviewAction(_ sender: Any) {
        let requestReview = ReviewService.shared

        requestReview.writeReview()
    }

    @IBAction func skipReviewAction(_ sender: Any) {
    }
}
