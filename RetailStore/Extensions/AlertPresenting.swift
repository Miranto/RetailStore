//
//  AlertPresenting.swift
//  RetailStore
//
//  Created by Mateusz Mirkowski on 08/05/2017.
//  Copyright © 2017 Mateusz Mirkowski. All rights reserved.
//

import UIKit

protocol UserAlertPresentable {
  var userPresentableMessage: String? { get }
}

protocol AlertPresenting {}

extension AlertPresenting where Self: UIViewController  {
  
  func presentCartAlert(title: String, message: String, action: Action? = nil) {
    let alertViewController = UIAlertController.okAlertController(title: title.capitalized, message: message, action: action)
    self.present(alertViewController, animated: true, completion: nil)
  }
}

extension UIAlertController {
  
  static func okAlertController(title: String, message: String, action: Action? = nil) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: Localized.ok.string.capitalized, style: .default) { (alertAction) in
      action?()
    }
    alertController.addAction(okAction)
    return alertController
  }
}
