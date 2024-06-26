//
//  UIView+Extension.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public extension UIView {
  func addSubview(_ view: () -> UIView) {
    addSubview(view())
  }
  
  func addSubviews(@AddSubviewBuilder _ views: () -> [UIView]) {
    views().forEach { view in
      addSubview(view)
    }
  }
  
  convenience init(frame: CGRect = .zero ,@AddSubviewBuilder _ views: () -> [UIView]) {
    self.init(frame: frame)
    addSubviews(views)
  }
}
