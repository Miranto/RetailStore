//
//  PriceView.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 08/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import SnapKit

class PriceView: UIView {
  
  var priceValue: Int? {
    didSet {
      if let price = priceValue {
        self.price.text = "Total: \(String(describing: price))"
      }
    }
  }
  
  // MARK: Initalizer
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
    addSubviews()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Subviews
  
  lazy var price: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 22, alignment: .center)
    return label
  }()
  
  private func setupView() {
    backgroundColor = UIColor(color: .backgroundLightBlue)
  }
  
  private func addSubviews() {
    addSubview(price)
  }
  
  private func setupLayout() {
    price.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(0)
    }
  }
  
}
