//
//  Localized.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//


import Foundation


enum Localized: String {
  
  case ok
  case error
  case buy
  case errorAddToCart                         = "error_add_to_cart"
  case successAddToCart                       = "success_add_to_cart"
  case cart
  case categories
  
  var string: String {
    return NSLocalizedString(self.rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
}
