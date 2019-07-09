//
//  AIVAButton.swift
//  Request a Review
//
//  Created by Pratik Bhaliya on 18/6/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class AIVAFeedbackButton: UIButton {
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(AIVAFeedbackButton.buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(AIVAFeedbackButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool:Bool) {
        isOn = bool
        
        let imageName = bool ? "checkboxActive" : "checkboxInactive"
        setImage(UIImage(named: imageName), for: .normal)
    }
}
