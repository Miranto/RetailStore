//
//  ProductViewController.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  fileprivate var viewModel: ProductViewModel
  
  // MARK: Initializers
  
  init(viewModel: ProductViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle
  
  override func loadView() {
    view = ProductView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = String(describing: viewModel.category).capitalized
    // Do any additional setup after loading the view.
    setupTableView()
    configureNavigationBar()
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

extension ProductViewController: UITableViewDataSource {
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
}

extension ProductViewController: UITableViewDelegate {
  
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
