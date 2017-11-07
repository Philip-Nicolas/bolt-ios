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
        super.viewDidLoad ()
    }
    
    override func viewDidAppear (_ animated: Bool) {
    }
    
    func centralManagerDidUpdateState (_ central: CBCentralManager) {
        switch (central.state) {
        case CBManagerState.poweredOn:
            break
        case CBManagerState.poweredOff:
            sendBTOffAlert ()
            break
        case CBManagerState.unsupported:
            sendBTUnsupportedAlert ()
            break
        default: break
        }
    }
    
    func sendBTUnsupportedAlert () {
        let alert = UIAlertController (title: "Bluetooth Unsupported", message: "Bluetooth is unsupported on your device. Sorry.", preferredStyle:UIAlertControllerStyle.alert)
        
        alert.addAction (UIAlertAction (title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.dismiss(animated: true, completion: nil)
        
        self.present (alert, animated: true, completion: nil)
    }
    
    func sendBTOffAlert () {
        let alert = UIAlertController (title: "Bluetooth Off", message: "Please enable Bluetooth in Settings, or in the Control Center.", preferredStyle:UIAlertControllerStyle.alert)
        
        alert.addAction (UIAlertAction (title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss (animated: true, completion: nil)
        }))
        
        alert.addAction (UIAlertAction (title: "Go to Settings", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss (animated: true, completion: nil)
        }))
        
        self.present (alert, animated: true, completion: nil)
    }
}
