//
//  UITableView+Helpers.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 05/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit


extension UITableView {
  
  func registerTableViewCellClass<T: UITableViewCell>(_ tableViewCellClass: T.Type) where T: ReusableView  {
    register(tableViewCellClass, forCellReuseIdentifier: tableViewCellClass.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(_ tableViewCellClass: T.Type) -> T where T: ReusableView {
    return (self.dequeueReusableCell(withIdentifier: tableViewCellClass.reuseIdentifier) as? T)!
  }
  
  func hideSeparatorForEmptyCells() {
    tableFooterView = UIView(frame: .zero)
  }
  
  // allows e.g. immediate highligthed state of buttons in cells
  func disableContentTouchesDelay() {
    delaysContentTouches = false
    
    for case let scrollView as UIScrollView in subviews {
      scrollView.delaysContentTouches = false
    }
  }
  
//  func showAsBackground(text: String) {
//    backgroundView = TextBackgroundView(text: text)
//  }
  
  func hideBackground() {
    backgroundView = nil
  }
}
