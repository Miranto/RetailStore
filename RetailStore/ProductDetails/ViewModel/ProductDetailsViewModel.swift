//
//  ProductDetailsViewModel.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 07/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import Foundation
import RxSwift

class ProductDetailsViewModel: ProductDetailsViewModeling {
  
  var product: Product
  var products: [Product]?
  
  init(product: Product) {
    self.product = product
  }

  func buy(success: () -> Void, error: () -> Void) {
    if !checkIfProductIsInCart(product: product) {
      products!.append(product)
      SavingManager.saveData(object: products!, filePath: Product.ArchiveURL)
      success()
    } else {
      error()
    }
  }
  
  func checkIfProductIsInCart(product: Product) -> Bool {
    products = SavingManager.loadData(filePath: Product.ArchiveURL)
    for object in products! {
      if object.name == product.name {
        return true
      }
    }
    return false
  }
}
