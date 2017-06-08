//
//  ProductView.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//


import UIKit
import SnapKit

class ProductView: UIView {
  
  // MARK: Initalizer
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Subviews
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  
  private func addSubviews() {
    addSubview(tableView)
  }
  
  private func setupLayout() {
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(0)
    }
  }
  
}
