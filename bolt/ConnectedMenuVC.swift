//
//  ConnectedMenuVC.swift
//  bolt
//
//  Created by Philip-Nicolas on 2017-11-14.
//  Copyright © 2017 Philip-Nicolas Varga. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class ConnectedMenuVC: UIViewController {
    var board: CBPeripheral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addBoard (board: CBPeripheral) {
        self.board = board
    }
}
