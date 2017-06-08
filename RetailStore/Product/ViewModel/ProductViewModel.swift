//
//  ProductViewModel.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

class ProductViewModel {
  
  var productsData: [Product] = []
  var category: CategoryName {
    didSet {
      switch category {
      case .electronics:
          productsData = [
          Product(name: "Microwave oven", image: UIImage(asset: .electronics)!, price: 200),
          Product(name: "Television", image: UIImage(asset: .electronics)!, price: 550),
          Product(name: "Vacuum Cleaner", image: UIImage(asset: .electronics)!, price: 150),
          
      ]
      case .furniture:
          productsData = [
          Product(name: "Table", image: UIImage(asset: .furniture)!, price: 40),
          Product(name: "Chair", image: UIImage(asset: .furniture)!, price: 15),
          Product(name: "Almirah", image: UIImage(asset: .furniture)!, price: 50),
          ]
      }
    }
  }
  
  init(category: CategoryName) {
    self.category = category
    setCategory(category)
  }
  
  func setCategory(_ category: CategoryName) {
    self.category = category
  }
  
}
