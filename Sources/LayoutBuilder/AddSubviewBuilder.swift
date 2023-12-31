//
//  AddSubviewBuilder.swift
//
//
//  Created by hoseung Lee on 12/5/23.
//

import UIKit

@resultBuilder
public struct AddSubviewBuilder {
  public static func buildBlock(_ components: UIView...) -> [UIView] {
    components
  }
  
  public static func buildBlock(_ components: [UIView]) -> [UIView] {
    components
  }
  
  public static func buildBlock(_ components: [UIView]...) -> [UIView] {
    components.flatMap { $0 }
  }
  
  public static func buildArray(_ components: [[UIView]]) -> [UIView] {
    components.flatMap { $0 }
  }
  
  public static func buildOptional(_ component: [UIView]?) -> [UIView] {
    component ?? []
  }
  
  public static func buildExpression(_ expression: UIView) -> [UIView] {
    [expression]
  }
}
