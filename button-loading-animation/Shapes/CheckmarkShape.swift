//
//  CheckmarkShape.swift
//  button-loading-animation
//
//  Created by José Tony on 10/01/23.
//

import SwiftUI

struct Checkmark: Shape {
  func path(in rect: CGRect) -> Path {
    let width = rect.size.width
    let height = rect.size.height
    
    var path = Path()
    path.move(to: .init(x: 0 * width, y: 0.5 * height))
    path.addLine(to: .init(x: 0.4 * width, y: 1.0 * height))
    path.addLine(to: .init(x: 1.0 * width, y: 0 * height))
    
    return path
  }
}
