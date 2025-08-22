  //
  //  OnboardingView.swift
  //  RestartTutorialApp
  //
  //  Created by Anthony on 22/8/25.
  //

import SwiftUI

struct OnboardingView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = true

  var body: some View {
    ZStack {
      Color.colorBlue.ignoresSafeArea()

      VStack {
          //MARK: - HEADER
        Spacer()
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          Text("""
            It's not how much we give but how much love we put into giving.
            """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundStyle(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        }
          //MARK: - CENTER
        ZStack {
          ZStack {
            Circle().stroke(.white.opacity(0.2), lineWidth: 40)
              .frame(width: 260, alignment: .center)
            Circle().stroke(.white.opacity(0.2), lineWidth: 80)
              .frame(width: 260, alignment: .center)
          }
          Image(.character1)
            .resizable()
            .scaledToFit()
        }
        Spacer()
          //MARK: - FOOTER

//        Text("Onboarding")
//          .font(.largeTitle)
//
//        Button {
//          isOnboardingViewActive = false
//        } label: {
//          Text("Start")
//        }
      } //: VS
    } //: ZS
  }
}

#Preview {
  OnboardingView()
}
