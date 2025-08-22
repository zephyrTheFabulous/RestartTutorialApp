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

    var body: some View {
      ZStack {
        Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
          .frame(width: 260, alignment: .center)
        Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
          .frame(width: 260, alignment: .center)
      }
    }
}

#Preview {
  ZStack {
    Color.blue.ignoresSafeArea()

    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
  }
}
