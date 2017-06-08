//
//  SavingManager.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 07/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import Foundation

protocol SavingManagerModeling {
  static func getPath(_ path: String) -> String
  static func saveData(object: [Product], filePath: String)
  static func loadData(filePath: String) -> [Product]
  static func remove(product: Product)
}

class SavingManager: SavingManagerModeling {
  static func getPath(_ path: String) -> String {

    return path
  }

  static func loadData(filePath: String) -> [Product] {
    let result = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Product]
    return result ?? [Product]()
  }

  static func saveData(object: [Product], filePath: String) {
    NSKeyedArchiver.archiveRootObject(object, toFile: filePath)
  }
  
  static func remove(product: Product) {
    var products = loadData(filePath: Product.ArchiveURL)
    
    for (index, object) in products.enumerated() {
      if object.name == product.name {
        products.remove(at: index)
      }
    }

    saveData(object: products, filePath: Product.ArchiveURL)
  }

  
//  var filePath: String {
//    //1 - manager lets you examine contents of a files and folders in your app; creates a directory to where we are saving it
//    let manager = FileManager.default
//    //2 - this returns an array of urls from our documentDirectory and we take the first path
//    let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
//    print("this is the url path in the documentDirectory \(url)")
//    //3 - creates a new path component and creates a new file called "Data" which is where we will store our Data array.
//    return (url!.appendingPathComponent("Data").path)
//  }
  
}
