//
//  BulbViewManager.swift
//  LightApp
//
//  Created by Chau, Cuong | DCMS on 2020/04/18.
//

import Foundation

@objc(BulbViewManager)
class BulbViewManager: RCTViewManager {
  override func view() -> UIView! {
    return BulbView()
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }  
}
