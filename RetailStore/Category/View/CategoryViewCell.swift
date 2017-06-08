//
//  CategoryViewCell.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 06/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//


import UIKit
import SnapKit

class CategoryViewCell: UITableViewCell {
  
  static let Identifier = "CategoryViewCell"
  
  var category: Category? {
    didSet {
      name.text = category?.name
      backgroundImage.image = category?.image
    }
  }
  
  let name: UILabel = {
    let label = UILabel.makeLabelWithNoText(color: .white, weight: .regular, size: 22, alignment: .center)
    return label
  }()
  
  lazy var backgroundImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
    }()
  
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

  // MARK: Private
  
  private func setupView() {
    selectionStyle = .none
  }
  
  private func addSubviews() {
    contentView.addSubview(backgroundImage)
    contentView.addSubview(name)
  }
  
  // MARK: Layout
  
  private func setupLayout() {
    
    name.snp.makeConstraints { (make) in
      make.centerY.equalTo(self.snp.centerY)
      make.centerX.equalTo(self.snp.centerX)
    }
    
    backgroundImage.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.bottom.equalTo(0)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.centerX.equalTo(self.snp.centerX)
      make.centerY.equalTo(self.snp.centerY)
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
}
