//
//  UIDivider.swift
//
//
//  Created by hoseung Lee on 1/31/24.
//

import UIKit

open class UIDivider: NiblessUIView {
  public struct Configuration {
    
    public static let `default` = Configuration(
      axis: .vertical,
      weight: 1,
      color: .lightGray,
      inset: .zero
    )
    
    public var axis: NSLayoutConstraint.Axis
    public var weight: CGFloat
    public var color: UIColor
    public var inset: UIEdgeInsets
    
    public init(axis: NSLayoutConstraint.Axis, weight: CGFloat, color: UIColor, inset: UIEdgeInsets) {
      self.axis = axis
      self.weight = weight
      self.color = color
      self.inset = inset
    }
  }
  
  public var configuration: Configuration {
    didSet {
      layoutSubviews()
    }
  }
  
  open override var intrinsicContentSize: CGSize {
    size(superview, configuration)
  }
  
  public init(configuration: Configuration = .default) {
    self.configuration = configuration
    super.init(frame: .zero)
    
    layer.backgroundColor = configuration.color.cgColor
    layer.borderWidth = configuration.weight
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    if let superview = superview {
      layer.frame = CGRect(origin: superview.center, size: size(superview, configuration))
    }
    invalidateIntrinsicContentSize()
  }
  
  private func size(_ superview: UIView?, _ configuration: Configuration) -> CGSize {
    guard let superview = superview else { return .zero }
    if configuration.axis == .horizontal {
      return CGSize(width: superview.bounds.width, height: configuration.weight)
    } else {
      return CGSize(width: configuration.weight, height: superview.bounds.height)
    }
  }
}
