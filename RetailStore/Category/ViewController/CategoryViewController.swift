//
//  CategoryViewController.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryViewController: UIViewController {

  fileprivate let disposeBag = DisposeBag()
  fileprivate var viewModel: CategoryViewModel
  
  init(viewModel: CategoryViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = CategoryView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = Localized.categories.string.capitalized
    
    // Do any additional setup after loading the view.
    setupTableView()
    configureNavigationBar()
    
    viewModel.categories
      .asObservable()
      .bindTo(categoryView.tableView.rx.items(cellIdentifier: CategoryViewCell.reuseIdentifier, cellType:CategoryViewCell.self)) { row, category, cell in
        cell.category = category
      }
      .addDisposableTo(disposeBag)
    
    categoryView.tableView.rx.itemSelected
      .map { index in
        return (index, self.viewModel.categories.value[index.row])
      }
      .subscribe(onNext: { [weak self] indexPath, model in
        
        let productViewController = ProductViewController(viewModel: ProductViewModel(category: model.category))
        self?.navigationController?.pushViewController(productViewController, animated: true)
        
      }).addDisposableTo(disposeBag)
  }
  
  fileprivate var categoryView: CategoryView {
    return view as! CategoryView
  }
  
  private func setupTableView() {
    categoryView.tableView.registerTableViewCellClass(CategoryViewCell.self)
    categoryView.tableView.hideSeparatorForEmptyCells()
    categoryView.tableView.disableContentTouchesDelay()
    categoryView.tableView.isScrollEnabled = true
    categoryView.tableView.backgroundColor = UIColor(color: .backgroundBaseBlue)
    categoryView.tableView.keyboardDismissMode = .interactive
    categoryView.tableView.separatorStyle = .none
    categoryView.tableView.showsHorizontalScrollIndicator = false
    categoryView.tableView.showsVerticalScrollIndicator = false
    categoryView.tableView.bounces = false
    categoryView.tableView.rowHeight = UITableViewAutomaticDimension
    categoryView.tableView.estimatedRowHeight = 100
    categoryView.tableView.rx.setDelegate(self).addDisposableTo(disposeBag)
  }
  
}

extension CategoryViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}
