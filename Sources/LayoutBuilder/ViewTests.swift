//
//  ViewTests.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

final class ViewTests: BuildableView {
  let colors: [String: UIColor] = [
    "Hello": .red,
    "World": .blue,
    "Swift": .orange
  ]
  let contents: [String]

  private var spacingLabel: UILabel!
  private var spacing: CGFloat = 33 {
    didSet {
      dynamicSpacer.spacing = spacing
      spacingLabel.text = "\(spacing)"
      UIView.animate(withDuration: 0.3) {
        self.layoutIfNeeded()
      }
    }
  }
  private var dynamicSpacer: UISpacer!
  
  override var intrinsicContentSize: CGSize {
    return contentView.intrinsicContentSize
  }
  
  init(contents: [String]) {
    self.contents = contents
    super.init(axis: .vertical, frame: .zero)
    contentView.spacing = 0
    backgroundColor = .green
    contentView.distribution = .fill
  }
  
  override func setup(stackView: UIStackView) {
    super.setup(stackView: stackView)
    stackView.addArrangedSubviews {
      UISpacer(spacing: 66)
      UILabel()
        .modify { label in
          label.text = "\(spacing)"
        }
        .storeReference(store: &spacingLabel)
      UIStackView(axis: .horizontal) {
        UIButton(type: .system)
          .modify {
            $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            $0.addTarget(self, action: #selector(didTapArrowButton(_:)), for: .touchUpInside)
            $0.tag = 0
          }
        UIDivider()
          .modify { divider in
            divider.configuration.weight = 1
            divider.configuration.color = .red
            divider.configuration.inset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
          }
        UIButton(type: .system)
          .modify {
            $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
            $0.addTarget(self, action: #selector(didTapArrowButton(_:)), for: .touchUpInside)
            $0.tag = 1
          }
      }
      UISpacer(spacing: 12)
      for content in contents {
        UILabel()
          .modify { label in
            label.text = content
            label.backgroundColor = colors[content]
          }
        UIDivider()
          .modify { divider in
            divider.configuration.axis = .horizontal
            divider.configuration.weight = 1
            divider.configuration.color = .red
            divider.configuration.inset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
          }
      }
      UISpacer(spacing: 12)
      for content in contents {
        UILabel()
          .modify { label in
            label.text = content
            label.backgroundColor = colors[content]
          }
        if content == "World" {
          UISpacer(spacing: spacing)
            .storeReference(store: &dynamicSpacer)
        }
      }
      UIView()
    }
  }
  
  @objc
  private func didTapArrowButton(_ sender: UIButton) {
    if sender.tag == 0 {
      spacing -= 10
    } else if sender.tag == 1 {
      spacing += 10
    }
  }
}

@available(iOS 17.0, *)
#Preview(traits: .portrait) {
  ViewTests(contents: ["Hello", "World", "Swift"])
}
