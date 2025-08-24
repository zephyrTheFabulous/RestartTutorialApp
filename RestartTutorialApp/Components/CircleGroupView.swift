//
//  CircleGroupView.swift
//  RestartTutorialApp
//
//  Created by Anthony on 23/8/25.
//

import SwiftUI

struct CircleGroupView: View {
  let shapeColor: Color
  let shapeOpacity: Double
  @State private var isAnimating = false

    var body: some View {
      ZStack {
        Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
          .frame(width: 260, alignment: .center)
        Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
          .frame(width: 260, alignment: .center)
      }
      .blur(radius: isAnimating ? 0:10)
      .opacity(isAnimating ? 1:0)
      .scaleEffect(isAnimating ? 1:0.5)
      .animation(.easeOut(duration: 1), value: isAnimating)
      .onAppear {
        isAnimating = true
      }
    }
}

#Preview {
  ZStack {
    Color.blue.ignoresSafeArea()

    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
  }
}
