//
//  Color.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


enum Color: String {
  case white                 = "#FFFFFF"
  case black                 = "#000000"
  case backgroundBaseBlue    = "#1c1f33"
  case backgroundLightBlue   = "#1a2445"
  case backgroundDarkBlue    = "#191a27"
  case textGray              = "#7c8097"
  case textLightGray         = "#e0e2ee"
  case red                   = "#d84d51"
  case lightBlue             = "#3f84f6"
  case green                 = "#26c488"
  case yellow                = "#ffc033"
  case borderBlue            = "#343852"
}

extension UIColor {
  convenience init(color: Color) {
    self.init(hex: color.rawValue)
  }
}

