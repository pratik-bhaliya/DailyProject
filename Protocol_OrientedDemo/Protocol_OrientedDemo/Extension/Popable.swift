//
//  Popable.swift
//  Protocol_OrientedDemo
//
//  Created by Pratik Bhaliya on 1/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

protocol Popable {}

extension Popable where Self: UIView {
    func pop() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { self.alpha = 1.0 }) { (animationCompleted) in
                        if animationCompleted == true {
                            UIView.animate(withDuration: 0.3,
                                           delay: 2.0,
                                           options: .curveEaseOut,
                                           animations: { self.alpha = 0.0 },
                                           completion: nil)
                        }
        }
    }
}
