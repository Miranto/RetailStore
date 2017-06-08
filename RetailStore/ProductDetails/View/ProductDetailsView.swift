//
//  ProductDetailsView.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 07/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit
import SnapKit

class ProductDetailsView: UIView {
  
  var product: Product? {
    didSet {
      name.text = product?.name
      productImage.image = product?.image
      if let price = product?.price {
        self.price.text = String(describing: price)
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
  
  let name: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 26, alignment: .left)
    return label
  }()
  
  lazy var productImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
    }()
  
  lazy var price: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 20, alignment: .left)
    return label
  }()
  
  let buyButton: UIButton = {
    let button = BaseButton(localizedTitle: .buy, style: .blueBordered)
    return button
  }()
  
  // MARK: Private
  
  private func setupView() {
        backgroundColor = UIColor(color: .backgroundLightBlue)
  }
  
  private func addSubviews() {
    addSubview(productImage)
    addSubview(name)
    addSubview(price)
    addSubview(buyButton)
  }
  
  private func setupLayout() {
    
    productImage.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.height.equalTo(self.snp.height).dividedBy(2.2)
    }
    
    name.snp.makeConstraints { (make) in
      make.top.equalTo(productImage.snp.bottom).offset(20)
      make.left.equalTo(20)
      make.right.equalTo(0)
    }
    
    price.snp.makeConstraints { (make) in
      make.top.equalTo(name.snp.bottom).offset(20)
      make.left.equalTo(20)
      make.right.equalTo(0)
    }
    
    buyButton.snp.makeConstraints { (make) in
      make.height.equalTo(40)
      make.width.equalTo(150)
      make.centerX.equalTo(self.snp.centerX)
      make.bottom.equalTo(-20)
    }
    
  }
  
}
