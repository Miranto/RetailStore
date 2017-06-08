//
//  ProductDetailsViewController.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import RxSwift

class ProductDetailsViewController: UIViewController, AlertPresenting {
  
  fileprivate var viewModel: ProductDetailsViewModel
  
  // MARK: Initializers

  init(viewModel: ProductDetailsViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle
  
  override func loadView() {
    view = ProductDetailsView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = String(describing: viewModel.product.name)
    
    configureNavigationBar()
    productDetailsView.product = viewModel.product
    productDetailsView.buyButton.addTarget(self, action: #selector(buyProduct), for: .touchUpInside)

  }
  
  func buyProduct() {
    viewModel.buy(success: {
      presentCartAlert(title: Localized.ok.string, message: Localized.successAddToCart.string)
      self.navigationController?.popViewController(animated: true)
    }, error: {
      presentCartAlert(title: Localized.error.string, message: Localized.errorAddToCart.string)
      
    })
    
  }
  
  fileprivate var productDetailsView: ProductDetailsView {
    return view as! ProductDetailsView
  }
  
}
