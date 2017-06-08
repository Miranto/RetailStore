//
//  RetailStoreTests.swift
//  RetailStoreTests
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import XCTest
@testable import RetailStore

class RetailStoreTests: XCTestCase {
  
  /*
 
    Sorry for low test number. :(
   
  */
  
  
  var products = [
    Product(name: "name1", image: UIImage(asset: .electronics)!, price: 200),
    Product(name: "name2", image: UIImage(asset: .electronics)!, price: 500),
    Product(name: "name3", image: UIImage(asset: .electronics)!, price: 500),
    Product(name: "name4", image: UIImage(asset: .electronics)!, price: 100),
    Product(name: "name5", image: UIImage(asset: .electronics)!, price: 200)
  ]
  
  var viewModel: CartViewModel?
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    viewModel = CartViewModel(products: products)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testInitialization() {
    
    XCTAssertNotNil(viewModel, "View model should not be nil.")
    XCTAssertTrue((viewModel?.productsData)! == products , "The products should be equal to the viewModel that was passed in.")
  }
  
  func testSumCart() {
    let sum = viewModel?.sumCart()
    
    XCTAssertEqual(sum, 1500)
  }

  func testSaveData() {
    let product = Product(name: "name6", image: UIImage(asset: .electronics)!, price: 200)
    products.append(product)
    SavingManager.saveData(object: products, filePath: Product.ArchiveURL)
    
    XCTAssertEqual(products.count, 6)
  }
  
  func testRemoveData() {
    let product = viewModel?.productsData[0]
    SavingManager.remove(product: product!)
    XCTAssertEqual(viewModel?.productsData.count, 5)
  }
 
}
