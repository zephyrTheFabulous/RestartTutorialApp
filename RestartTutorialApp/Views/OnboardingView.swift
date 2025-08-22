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
        VStack {
          Text("Onboarding")
            .font(.largeTitle)

          Button {
            isOnboardingViewActive = false
          } label: {
            Text("Start")
          }
        } //: VS
    }
}

#Preview {
    OnboardingView()
}
