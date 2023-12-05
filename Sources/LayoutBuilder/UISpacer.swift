//
//  UISpacer.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public final class UISpacer: UIView {
  private var axis: NSLayoutConstraint.Axis = .vertical
  private let spacing: CGFloat
  
  public override var intrinsicContentSize: CGSize {
    CGSize(width: axis == .horizontal ? spacing : 0, height: axis == .vertical ? spacing : 0)
  }
  
  public init(spacing: CGFloat, frame: CGRect = .zero) {
    self.spacing = spacing
    super.init(frame: frame)
    setup()
  }
  
  public required init?(coder: NSCoder) {
    self.spacing = 0
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    guard let axis = (superview as? UIStackView)?.axis else { return }
    self.axis = axis
    invalidateIntrinsicContentSize()
  }
}
