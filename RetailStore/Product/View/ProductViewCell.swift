//
//  ProductViewCell.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//


import UIKit
import SnapKit

class ProductViewCell: UITableViewCell {
  
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
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
    addSubviews()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Subviews
  
  let name: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 22, alignment: .center)
    return label
  }()
  
  lazy var productImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
    }()
  
  lazy var price: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 20, alignment: .center)
    return label
  }()
  
  // MARK: Private
  
  private func setupView() {
    backgroundColor = UIColor(color: .backgroundBaseBlue)
    selectionStyle = .none
  }
  
  private func addSubviews() {
    contentView.addSubview(productImage)
    contentView.addSubview(name)
    contentView.addSubview(price)
  }
  
  // MARK: Layout
  
  private func setupLayout() {
    
    productImage.snp.makeConstraints { (make) in
      make.left.equalTo(20)
      make.height.width.equalTo(100)
      make.centerY.equalTo(self.snp.centerY)
    }
    
    name.snp.makeConstraints { (make) in
      make.left.equalTo(productImage.snp.right).offset(20)
      make.centerY.equalTo(self.snp.centerY)
    }
    
    price.snp.makeConstraints { (make) in
      make.right.equalTo(-10)
      make.centerY.equalTo(self.snp.centerY)
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
}
