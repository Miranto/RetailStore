//
//  CartViewController.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 08/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
  
  // MARK: Properties
  
  fileprivate var viewModel: CartViewModel
  fileprivate let priceView = PriceView()
  
  // MARK: Initializers
  
  init(viewModel: CartViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle
  
  override func loadView() {
    view = ProductView()
    
    view.addSubview(priceView)
    
    priceView.snp.makeConstraints { (make) in
      make.height.equalTo(60)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(0)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = Localized.cart.string.capitalized
    
    setupTableView()
    updatePrice()
  }
  
  // MARK: Private
  
  fileprivate func updatePrice() {
    let sum = viewModel.sumCart()
    priceView.priceValue = sum
  }
  
  fileprivate var productView: ProductView {
    return view as! ProductView
  }
  
  private func setupTableView() {
    productView.tableView.registerTableViewCellClass(ProductViewCell.self)
    productView.tableView.hideSeparatorForEmptyCells()
    productView.tableView.disableContentTouchesDelay()
    productView.tableView.isScrollEnabled = true
    productView.tableView.backgroundColor = UIColor(color: .backgroundBaseBlue)
    productView.tableView.keyboardDismissMode = .interactive
    productView.tableView.separatorStyle = .none
    productView.tableView.showsHorizontalScrollIndicator = false
    productView.tableView.showsVerticalScrollIndicator = false
    productView.tableView.bounces = false
    productView.tableView.rowHeight = UITableViewAutomaticDimension
    productView.tableView.estimatedRowHeight = 100
    productView.tableView.delegate = self
    productView.tableView.dataSource = self
  }
  
}

extension CartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(ProductViewCell.self)
    cell.product = viewModel.productsData[indexPath.row]
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.productsData.count
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      SavingManager.remove(product: self.viewModel.productsData[indexPath.row])
      self.viewModel.productsData.remove(at: indexPath.row)
      productView.tableView.deleteRows(at: [indexPath], with: .automatic)
      updatePrice()
    }
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
}

extension CartViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let model = viewModel.productsData[indexPath.row]
    let productDetailsViewModel = ProductDetailsViewModel(product: model)
    let productDetailsViewController = ProductDetailsViewController(viewModel: productDetailsViewModel)
    self.navigationController?.pushViewController(productDetailsViewController, animated: true)
  }
  
}
