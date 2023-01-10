//
//  AnimatedCheckmarkView.swift
//  button-loading-animation
//
//  Created by José Tony on 10/01/23.
//

import SwiftUI

struct AnimatedCheckmarkView: View {
  var animationDuration: Double = 0.27
  @State private var innerTrimEnd: CGFloat = 0
  
  var onAnimationEnded: () -> Void
  
  func animate() {
    withAnimation(
      .linear(duration: animationDuration)
    ) {
      innerTrimEnd = 1.0
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
      onAnimationEnded()
    }
  }
  
  var body: some View {
    ZStack {
      Checkmark()
        .trim(from: 0, to: innerTrimEnd)
        .stroke(lineWidth: 3.5)
        .frame(width: 20, height: 16)
    }
    .frame(width: 24, height: 24)
    .onAppear() {
      animate()
    }
  }
}
