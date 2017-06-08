//
//  Category.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

enum CategoryName {
  case electronics
  case furniture
}

struct Category {
  var name: String
  var image: UIImage
  var category: CategoryName
		
  
}
