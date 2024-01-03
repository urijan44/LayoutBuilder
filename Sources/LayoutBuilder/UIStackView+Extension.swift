//
//  UIStackView+Extension.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public extension UIStackView {
  convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, @AddSubviewBuilder _ addArrangedSubviews: () -> [UIView]) {
    self.init()
    self.axis = axis
    self.spacing = spacing
    addArrangedSubviews().forEach { view in
      addArrangedSubview(view)
    }
  }
  
  func addArrangedSubviews(@AddSubviewBuilder _ addArrangedSubviews: () -> [UIView]) {
    addArrangedSubviews().forEach { view in
      addArrangedSubview(view)
    }
  }
}
