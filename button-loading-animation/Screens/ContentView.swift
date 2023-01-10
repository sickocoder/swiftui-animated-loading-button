//
//  ContentView.swift
//  button-loading-animation
//
//  Created by José Tony on 10/01/23.
//

import SwiftUI

struct ContentView: View {
  @State private var isLoading: Bool = false
  @State private var showsCheckmark: Bool = false
  @State private var scale: CGFloat = 1
  
  private var pulseAnimationDuration = 0.3
  
  func toogleCheckmark(after: Double) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
      withAnimation {
        showsCheckmark = true
      }
    }
  }
  
  var body: some View {
    VStack {
      Button {
        showsCheckmark = false
        withAnimation(.spring(blendDuration: 0.4)) {
          isLoading.toggle()
        }
        
        if isLoading {
          toogleCheckmark(after: 3)
        }
      } label: {
        HStack {
          if showsCheckmark {
            AnimatedCheckmarkView {
              withAnimation(
                .easeIn(duration: pulseAnimationDuration)
              ) {
                scale = 1.3
              }
              
              withAnimation(
                .easeOut(duration: pulseAnimationDuration)
                .delay(pulseAnimationDuration)) {
                  scale = 1
                }
            }
            
          } else if isLoading {
            ProgressView()
              .tint(.white)
          } else {
            Text("Click Me")
              .bold()
          }
        }
        .frame(
          width: isLoading ? 24 : 200,
          height: isLoading ? 24 : .nan
        )
        .padding(.horizontal, isLoading ? 5 : 20)
        .padding(.vertical, 10)
      }
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(isLoading ? .capsule : .roundedRectangle)
      .tint(.green)
      .scaleEffect(scale)
      
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}





