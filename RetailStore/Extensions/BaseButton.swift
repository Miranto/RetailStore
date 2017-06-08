//
//  BaseButton.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 07/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


enum BaseButtonStyle {
  case blueBordered
  case grayBordered
  case filled
  case yellow
  case red
  
  var textColor: UIColor {
    switch self {
    case .blueBordered, .grayBordered, .filled, .red:
      return UIColor(color: .white)
    case .yellow:
      return UIColor(color: .black)
    }
  }
  
  var backgroundColor: UIColor {
    switch self {
    // touch field is limited when backgroundColor of UIButton is set to clear
    case .blueBordered, .grayBordered: return UIColor(white:0.000, alpha:0.020)
    case .filled: return UIColor(color: .lightBlue)
    case .yellow: return UIColor(color: .yellow)
    case .red: return UIColor(color: .red)
    }
  }
  
  var borderColor: UIColor? {
    switch self {
    case .blueBordered:
      return UIColor(color: .lightBlue)
    case .grayBordered:
      // TODO: inconsistent color naming
      return UIColor(color: .borderBlue)
      
    default:
      return nil
    }
  }
}

class BaseButton: UIButton {
  
  convenience init(localizedTitle: Localized, style: BaseButtonStyle) {
    self.init(title: localizedTitle.string, style: style)
  }
  
  init(title: String? = nil, style: BaseButtonStyle)  {
    super.init(frame: .zero)
    setupView(title: title, style: style)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView(title: String?, style: BaseButtonStyle) {
    if let title = title {
      setTitle(title.uppercased(), for: .normal)
    }
    setTitleColor(style.textColor, for: .normal)
    setTitleColor(style.backgroundColor, for: .highlighted)
    titleLabel?.font = UIFont.systemFont(ofSize: 13.5)
    backgroundColor = style.backgroundColor
    
    if let borderColor = style.borderColor {
      layer.borderWidth = 1.0
      layer.borderColor = borderColor.cgColor
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layer.cornerRadius = self.frame.size.height / 2
  }
}

extension BaseButton {
  
  func activate() {
    alpha = 1
    isEnabled = true
  }
  
  func deactivate() {
    alpha = 0.3
    isEnabled = false
  }
  
  func setLocalizedTitle(_ localizedTitle: Localized?) {
    setTitle(localizedTitle?.string.uppercased(), for: .normal)
  }
}
