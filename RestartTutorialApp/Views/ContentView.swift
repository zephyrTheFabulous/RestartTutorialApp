//
//  ContentView.swift
//  RestartTutorialApp
//
//  Created by Anthony on 22/8/25.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = true

    var body: some View {
      ZStack {
        if isOnboardingViewActive {
          OnboardingView()
        } else {
          HomeView()
        }
      }
    }
}

#Preview {
    ContentView()
}
