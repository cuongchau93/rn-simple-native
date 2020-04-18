//
//  BulbView.swift
//  LightApp
//
//  Created by Chau, Cuong | DCMS on 2020/04/18.
//
import UIKit

class BulbView: UIView {
  @objc var onStatusChanged: RCTDirectEventBlock?
  @objc var isOn: Bool = false  {
    didSet {
      button.setTitle(String(describing: isOn ? "Switch Off" : "Switch On"), for: .normal)
      button.backgroundColor = isOn ? .yellow : .black
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(button)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init has not been implemented")
  }
  lazy var button: UIButton = {
    let button = UIButton.init(type: UIButton.ButtonType.system)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    button.addTarget(
      self,
      action: #selector(changeBulbStatus),
      for: .touchUpInside
    )
    return button
  }()
  @objc func changeBulbStatus() {
    isOn = !isOn as Bool
    onStatusChanged!(["isOn": isOn])
  }  
}
