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
    }
  }
  private var dynamicSpacer: UISpacer!
  
  init(contents: [String]) {
    self.contents = contents
    super.init(axis: .vertical, frame: .zero)
    contentView.spacing = 3
  }
  
  override func setup(stackView: UIStackView) {
    super.setup(stackView: stackView)
    stackView.addArrangedSubviews {
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
    }
  }
  
  @objc
  private func didTapArrowButton(_ sender: UIButton) {
    if sender.tag == 0 {
      spacing -= 1
    } else if sender.tag == 1 {
      spacing += 1
    }
  }
}

@available(iOS 17.0, *)
#Preview(traits: .portrait) {
  ViewTests(contents: ["Hello", "World", "Swift"])
}
