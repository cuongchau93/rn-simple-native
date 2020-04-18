//
//  Bulb.swift
//  LightApp
//
//  Created by Chau, Cuong | DCMS on 2020/04/14.
//

import Foundation

@objc(Bulb)
class Bulb: NSObject {
  @objc
  static var isOn = false
  
  @objc
  func turnOn() {
    Bulb.isOn = true
    print("Bulb is now ON")
  }
  
  @objc
  func turnOff() {
    Bulb.isOn = false
    print("Bulb is now OFF")
  }
  @objc
  func getStatus(_ callback: RCTResponseSenderBlock) {
    callback([NSNull(), Bulb.isOn])
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
