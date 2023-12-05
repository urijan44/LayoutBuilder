//
//  Modifier.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public protocol Modifier {}

public extension Modifier where Self: Any {
  @discardableResult
  @inlinable
  func modify(_ build: (Self) throws -> Void) rethrows -> Self {
    try build(self)
    return self
  }
}

extension NSObject: Modifier {}
