//
//  Product.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import CoreData

class Product: NSObject, NSCoding {
  
  // MARK: Properties
  
  var name: String
  var image: UIImage
  var price: Int
  
  // MARK: Initializers
  
  init(name: String, image: UIImage, price: Int) {
    self.name = name
    self.image = image
    self.price = price
  }
  
  //MARK: Archiving Paths
  
  static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.appendingPathComponent("product").path
  
  //MARK: Types
  
  struct ProductKey {
    static let name = "name"
    static let image = "image"
    static let price = "price"
  }
  
  // MARK: NSCoding
  
  required init?(coder decoder: NSCoder) {
    print(decoder)
    name = decoder.decodeObject(forKey: ProductKey.name) as! String
    image = decoder.decodeObject(forKey: ProductKey.image) as! UIImage
    price = decoder.decodeInteger(forKey: ProductKey.price)
    
    super.init()
  }
  
  func encode(with coder: NSCoder) {
    print(coder)
    coder.encode(self.name, forKey: ProductKey.name)
    coder.encode(self.image, forKey: ProductKey.image)
    coder.encodeCInt(Int32(self.price), forKey: ProductKey.price)
  }
}
