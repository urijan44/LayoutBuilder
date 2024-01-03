# Overview
LayoutBuilder is a Swift library designed to enable UIKit-based development with a syntax and style reminiscent of SwiftUI. 

# Features
Declarative Syntax: Write UI code in a style similar to SwiftUI, enhancing readability and ease of use.
Dynamic UI Elements: Easily create and modify UI components like labels, buttons, and spacers, with dynamic properties.

# Example Usage
```swift
import UIKit
import LayoutBuilder

class ViewController: UIViewController {
  private var container: UIStackView!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews {
      UIStackView(axis: .horizontal) {
        UILabel()
          .modify { label in
            label.text = "Hello, "
            label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
          }
        UILabel()
          .modify { label in
            label.text = "Swift"
          }
      }
      .modify {
        $0.alignment = .center
        $0.distribution = .fill
        $0.frame = view.bounds
      }
      .storeReference(store: &container)
    }
  }
}
```

# Example
[Example View](https://github.com/urijan44/LayoutBuilder/blob/main/Sources/LayoutBuilder/ViewTests.swift)

# Installation
Add LayoutBuilder to your Swift project as a dependency.
Import LayoutBuilder in your Swift files to start using its features.

# Contribution
Contributions to LayoutBuilder are welcome. Please follow the standard procedures for submitting issues, feature requests, and pull requests on GitHub.

# License
LayoutBuilder is available under [MIT License](https://github.com/urijan44/LayoutBuilder/blob/main/LICENSE.md)
