//
//  BuildableView.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

open class BuildableView: NiblessUIView {
  
  let defaultAxis: NSLayoutConstraint.Axis
  public var contentView = UIStackView()
  public var intrinsicContentWidth: CGFloat?
  public var intrinsicContentHeight: CGFloat?
  
  open override var intrinsicContentSize: CGSize {
    CGSize(
      width: intrinsicContentWidth ?? super.intrinsicContentSize.width,
      height: intrinsicContentHeight ?? super.intrinsicContentSize.height
    )
  }
  
  public init(axis: NSLayoutConstraint.Axis = .vertical, frame: CGRect) {
    self.defaultAxis = axis
    super.init(frame: frame)
    setup(stackView: contentView)
  }
  
  public override init(frame: CGRect) {
    self.defaultAxis = .vertical
    super.init(frame: frame)
    setup(stackView: contentView)
  }
  
  open func setup(stackView: UIStackView) {
    addSubview(contentView)
    contentView.axis = defaultAxis
    contentView.alignment = .center
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
