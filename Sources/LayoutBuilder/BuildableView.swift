//
//  BuildableView.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

open class BuildableView: NiblessUIView {
  
  var contentView = UIStackView()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup(stackView: contentView)
  }
  
  func setup(stackView: UIStackView) {
    addSubview(contentView)
    contentView.axis = .vertical
    contentView.alignment = .center
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
}
