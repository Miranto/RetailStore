//
//  CategoryViewModel.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import Foundation
import RxSwift

class CategoryViewModel {
  
  let categories = Variable([
      Category(name: "Electronics", image: UIImage(asset: .electronics)!, category: .electronics),
      Category(name: "Furniture", image: UIImage(asset: .furniture)!, category: .furniture),
      ])
}
