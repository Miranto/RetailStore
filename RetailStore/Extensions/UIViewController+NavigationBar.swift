//
//  UIViewController+NavigationBar.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 08/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

extension UIViewController {
  func configureNavigationBar() {
    let button1 = UIBarButtonItem(image: UIImage(asset: .cart), style: .plain, target: self, action: #selector(goToCart))
    self.navigationItem.rightBarButtonItem  = button1
  }
  
  func goToCart() {
    let products = SavingManager.loadData(filePath: Product.ArchiveURL)
    let cartViewController = CartViewController(viewModel: CartViewModel(products: products))
    self.navigationController?.pushViewController(cartViewController, animated: true)
  }
}
