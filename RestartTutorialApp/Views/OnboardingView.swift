  //
  //  OnboardingView.swift
  //  RestartTutorialApp
  //
  //  Created by Anthony on 22/8/25.
  //

import SwiftUI

struct OnboardingView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = true
  @State private var buttonWidth = UIScreen.main.bounds.width - 80 // -40 from each side
  @State private var buttonOffset: CGFloat = 0

  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { gesture in
        if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 { // 80 because it counts from the center of button(40 button side + 40 from screen side)
          buttonOffset = gesture.translation.width // only run when the dragging has been started in the right direction
        }
      }
      .onEnded { _ in
        withAnimation  { // button stick either to right side
          if buttonOffset >= buttonWidth / 2 {
            buttonOffset = buttonWidth - 80
            isOnboardingViewActive = false
          } else { // or to left side
            buttonOffset = 0
          }
        }
      }
  }

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
          CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
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
              .fill(.colorBlue)
              .frame(width: 80 + buttonOffset) // slider button trail effect(can be changed to colorRed)
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
            .offset(x: buttonOffset)
            .gesture(
              dragGesture
            )
            Spacer()
          }
        } //: FOOTER
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()

          //        Text("Onboarding")
          //          .font(.largeTitle)
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
