//
//  FeedbackViewController.swift
//  Request a Review
//
//  Created by Pratik Bhaliya on 18/6/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var otherDetailTextView: UITextView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var otherView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTextView.text = "Detail"
        detailTextView.textColor = UIColor.lightGray
        otherDetailTextView.text = "Please add any additional comments to help us improve your experience."
        otherDetailTextView.textColor = UIColor.lightGray
        detailTextView.isUserInteractionEnabled = false
        otherDetailTextView.isUserInteractionEnabled = false
    }
    
    @IBAction func selectionAction(_ sender: AIVAFeedbackButton) {
        if sender.isOn && sender.tag == 104 {
            detailTextView.isUserInteractionEnabled = true
        } else if sender.isOn && sender.tag == 105 {
            otherDetailTextView.isUserInteractionEnabled = true
        }
    }
}

extension FeedbackViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        if textView.tag == 101 {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.detailView.backgroundColor = UIColor(red: 252/255, green: 77/255, blue: 94/255, alpha: 1.0)
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.otherView.backgroundColor = UIColor(red: 252/255, green: 77/255, blue: 94/255, alpha: 1.0)
            }, completion: nil)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 101 && textView.text.isEmpty {
            textView.text = "Detail"
            textView.textColor = UIColor.lightGray
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.detailView.backgroundColor = UIColor.lightGray
            }, completion: nil)
        }else if textView.text.isEmpty {
            textView.text = "Please add any additional comments to help us improve your experience."
            textView.textColor = UIColor.lightGray
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.otherView.backgroundColor = UIColor.lightGray
            }, completion: nil)
        }
    }
}
