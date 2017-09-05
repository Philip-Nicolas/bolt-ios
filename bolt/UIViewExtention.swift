//
//  UIViewExtention.swift
//  bolt
//
//  Created by Philip-Nicolas Varga on 2017-08-31.
//  Copyright © 2017 Philip-Nicolas Varga. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    func fadeOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        })
    }
}
