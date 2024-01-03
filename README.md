# Overview
LayoutBuilder is a Swift library designed to enable UIKit-based development with a syntax and style reminiscent of SwiftUI. This innovative approach simplifies UI construction in UIKit by using a more declarative and concise syntax.

# Features
Declarative Syntax: Write UI code in a style similar to SwiftUI, enhancing readability and ease of use.
Dynamic UI Elements: Easily create and modify UI components like labels, buttons, and spacers, with dynamic properties.
Customizable Components: Leverage a range of UIKit components with extended functionalities.

# Example Usage
The provided example demonstrates the creation of a custom view (ViewTests) which inherits from BuildableView. This view includes various UIKit components such as labels, buttons, and spacers. Key features include:

A dictionary mapping strings to colors.
Dynamic UI updates based on user interactions.
Declarative style for adding and modifying UI elements.
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
[Example View](Sources/LayoutBuilder/ViewTest.swift)

# Installation
Add LayoutBuilder to your Swift project as a dependency.
Import LayoutBuilder in your Swift files to start using its features.

# Contribution
Contributions to LayoutBuilder are welcome. Please follow the standard procedures for submitting issues, feature requests, and pull requests on GitHub.

# License
LayoutBuilder is available under [MIT License](./LICENSE.md).