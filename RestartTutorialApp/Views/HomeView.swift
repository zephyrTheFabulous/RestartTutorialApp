  //
  //  HomeView.swift
  //  RestartTutorialApp
  //
  //  Created by Anthony on 22/8/25.
  //

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = false
  @State private var isAnimating = false // animation control

  var body: some View {
    VStack (alignment: .center, spacing: 20) {
        //MARK: - HEADER
      Spacer()
      ZStack {
        CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
        Image(.character2)
          .resizable()
          .scaledToFit()
          .padding()
          .offset(y: isAnimating ? 35:-35)
          .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
      }

        //MARK: - CENTER
      Text("The time that leads to mastery is dependent on the intensity of our focus.")
        .font(.title3)
        .fontWeight(.light)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
        .padding()

        //MARK: - FOOTER
      Spacer()
      Button {
        withAnimation {
          isOnboardingViewActive = true
          playSound(sound: "success", type: "m4a")
        }
      } label: {
        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
        Text("Restart")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      }
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .controlSize(.large)
    } //: VS
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
      {
        isAnimating = true
      }
    }
  }
}

#Preview {
  HomeView()
}
