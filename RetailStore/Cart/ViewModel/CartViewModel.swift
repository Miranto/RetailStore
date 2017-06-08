//
//  CartViewModel.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 08/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import Foundation

class CartViewModel: CartViewModeling {
  
  var productsData: [Product]
  
  init(products: [Product]) {
    self.productsData = products
  }
  
  func sumCart() -> Int {
    return productsData.reduce(0) { $0 + ($1.price) }
  }
}
