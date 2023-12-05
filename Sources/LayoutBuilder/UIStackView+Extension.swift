//
//  UIStackView+Extension.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public extension UIStackView {
  convenience init(axis: NSLayoutConstraint.Axis, @AddSubviewBuilder addArrangedSubviews: () -> [UIView]) {
    self.init()
    self.axis = axis
    addArrangedSubviews().forEach { view in
      addArrangedSubview(view)
    }
  }
}
