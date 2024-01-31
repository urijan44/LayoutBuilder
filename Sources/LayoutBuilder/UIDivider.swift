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
    
    public var vertical: CGFloat {
      inset.top + inset.bottom
    }
    
    public var horizontal: CGFloat {
      inset.left + inset.right
    }
    
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
    CGSize(
      width: super.intrinsicContentSize.width + configuration.horizontal,
      height: super.intrinsicContentSize.height + configuration.vertical
    )
  }
  
  public init(configuration: Configuration = .default) {
    self.configuration = configuration
    super.init(frame: .zero)
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    layer.frame = size(configuration)
    layer.borderColor = UIColor.clear.cgColor
    layer.backgroundColor = configuration.color.cgColor
    layer.borderWidth = configuration.weight
    invalidateIntrinsicContentSize()
  }
  
  private func size(_ configuration: Configuration) -> CGRect {
    if configuration.axis == .horizontal {
      return CGRect(
        x: configuration.inset.left,
        y: frame.midY - (configuration.weight / 2),
        width: (superview?.frame.width ?? .zero) - configuration.horizontal,
        height: configuration.weight
      )
    } else {
      return CGRect(
        x: frame.midX - (configuration.weight / 2),
        y: configuration.inset.top,
        width: configuration.weight,
        height: (superview?.frame.height ?? .zero) - configuration.vertical
      )
    }
  }
}
