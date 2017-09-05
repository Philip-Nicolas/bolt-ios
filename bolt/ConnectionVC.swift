//
//  ConnectionVC.swift
//  bolt
//
//  Created by Philip-Nicolas Varga on 2017-08-31.
//  Copyright © 2017 Philip-Nicolas Varga. All rights reserved.
//
import UIKit
import CoreBluetooth

class ConnectionVC: UIViewController, CBCentralManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //enableBTAlert()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch (central.state) {
        case CBManagerState.poweredOff:
            print("bluetooth is off")
            break
        case CBManagerState.poweredOn:
            print("bluetooth is on")
        default: break
        }
    }
    
    func enableBTAlert() {
        let alert = UIAlertController (title: "Bluetooth Off", message: "Please enable Bluetooth in Settings", preferredStyle:UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Go to Settings", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
