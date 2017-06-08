//
//  UILabelFactory.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


enum FontWeight: CGFloat {
  case light
  case regular
  case bold
  
  var value: CGFloat {
    switch self {
    case .light: return UIFontWeightLight
    case .regular: return UIFontWeightRegular
    case .bold: return UIFontWeightBold
    }
  }
}

extension UILabel {
  
  static func makeLabel(text: String? = "", color: Color = .white, weight: FontWeight = .light, size: CGFloat = 16, alignment: NSTextAlignment = .left) -> UILabel {
    let label = UILabel(frame: .zero)
    label.text = text
    label.textColor = UIColor(color: color)
    label.font = UIFont.systemFont(ofSize: size, weight: weight.value)
    label.numberOfLines = 0
    label.textAlignment = alignment
    label.shadowColor = .black
    label.layer.shadowOpacity = 3
    label.layer.shadowRadius = 3
    label.layer.shadowOffset = CGSize(width: 0, height: 1)
    return label
  }
  
  static func makeLabel(localizedText: Localized?, color: Color = .white, weight: FontWeight = .light, size: CGFloat = 16, alignment: NSTextAlignment = .left) -> UILabel {
    return makeLabel(text: localizedText?.string, color: color, weight: weight, size: size, alignment: alignment)
  }
  
  static func makeLabelWithNoText(color: Color = .white, weight: FontWeight = .light, size: CGFloat = 16, alignment: NSTextAlignment = .left) -> UILabel {
    return makeLabel(text: "", color: color, weight: weight, size: size, alignment: alignment)
  }
}
