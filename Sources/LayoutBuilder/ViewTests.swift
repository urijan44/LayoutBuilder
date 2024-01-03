//
//  ViewTests.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

final class ViewTests: BuildableView {
  let contents: [String]

  init(contents: [String]) {
    self.contents = contents
    super.init(axis: .vertical, frame: .zero)
    contentView.spacing = 3
  }
  
  override func setup(stackView: UIStackView) {
    super.setup(stackView: stackView)
    stackView.addArrangedSubviews {
      for content in contents {
        UILabel()
          .modify { label in
            label.text = content
          }
      }
      UISpacer(spacing: 12)
      for content in contents {
        UILabel()
          .modify { label in
            label.text = content
          }
        if content == "World" {
          UISpacer(spacing: 33)
        }
      }
    }
    backgroundColor = .red
  }
}

@available(iOS 17.0, *)
#Preview(traits: .portrait) {
  ViewTests(contents: ["Hello", "World", "Swift"])
}
