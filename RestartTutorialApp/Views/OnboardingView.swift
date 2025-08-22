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
        ZStack {
          // 1. Background (Static)
          Capsule()
            .fill(.white.opacity(0.2))
          Capsule()
            .fill(.white.opacity(0.2))
            .padding(8)

          // 2. Call-to-action (Static)
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .offset(x: 20)

          // 3. Capsule (Dynamic width)
          HStack {
            Capsule()
              .fill(.red)
              .frame(width: 80)
            Spacer()
          }

          // 4. Circle button (Draggable)
          HStack {
            ZStack {
              Circle()
                .fill(.colorRed)
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundStyle(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .onTapGesture {
              isOnboardingViewActive = false
            }
            Spacer()
          }
        } //: FOOTER
        .frame(height: 80, alignment: .center)
        .padding()

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
