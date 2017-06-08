//
//  UIImage+Asset.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


extension UIImage {
  convenience init?(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
