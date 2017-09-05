//
//  ConnectionTipsVC.swift
//  bolt
//
//  Created by Philip-Nicolas Varga on 2017-09-01.
//  Copyright © 2017 Philip-Nicolas Varga. All rights reserved.
//

import Foundation
import UIKit

class ConnectionTipsVC: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipImageView: UIImageView!
    
    let tipsAndImages = [("Make sure the Board is plugged in.", "path2"), ("Make sure the Board is turned on.", "path3"), ("Move closer to the Board.", "path1"), ("Make sure no one else is using the Board", "path4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.alpha = 0;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10, execute: {
            self.displayTips(tipNumber: 0)
        })
    }
    
    func displayTips(tipNumber: Int) {
        if (tipNumber < tipsAndImages.count) {
            tipLabel.text = tipsAndImages [tipNumber].0
            tipLabel.fadeIn(duration: 5)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10, execute: {
                self.tipLabel.fadeOut(duration: 5)
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20, execute: {
                self.displayTips(tipNumber: tipNumber + 1)
            })
        }
    }
}
