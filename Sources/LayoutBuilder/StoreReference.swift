//
//  StoreReference.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

public protocol StoreReference {}

public extension StoreReference where Self: Any {
  @discardableResult
  func storeReference<T>(store: inout T?) -> T {
    store = self as? T
    return store!
  }
}

extension NSObject: StoreReference {}
