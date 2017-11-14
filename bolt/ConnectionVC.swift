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
    var centralManager : CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        centralManager = CBCentralManager (delegate: self, queue: nil)
    }
    
    override func viewDidAppear (_ animated: Bool) {
    }
    
    func centralManagerDidUpdateState (_ central: CBCentralManager) {
        switch (central.state) {
        case CBManagerState.poweredOn:
            centralManager!.scanForPeripherals (withServices: nil, options: nil)
            break
        case CBManagerState.poweredOff:
            sendAlert(title: "Bluetooth Off", message: "Please enable Bluetooth in Settings, or in the Control Center.", options: ("Ok", nil), ("Go to Settings", nil))
            break
        case CBManagerState.unsupported:
            sendAlert(title: "Bluetooth Unsupported", message: "Bluetooth is unsupported on your device. Sorry", options: ("Ok", nil))
            break
        default: break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = advertisementData [CBAdvertisementDataLocalNameKey] as? String {
            if name == "BT05" {
                sendAlert(title: "Board Found!", message: "now what?", options: ("Ok", nil))
            }
        }
    }
    
    func sendAlert (title: String, message: String, options: (title: String, handler: (() -> Void)?)...) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        for option in options {
            alert.addAction(UIAlertAction (title: option.title, style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: option.handler)
            }))
        }
        
        self.present (alert, animated: true)
    }
}
