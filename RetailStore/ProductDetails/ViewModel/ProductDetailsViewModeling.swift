//
//  ProductDetailsViewModeling.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 07/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import Foundation

protocol ProductDetailsViewModeling {
  func buy(success: () -> Void, error: () -> Void)
  func checkIfProductIsInCart(product: Product) -> Bool
}
