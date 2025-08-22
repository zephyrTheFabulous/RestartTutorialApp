//
//  HomeView.swift
//  RestartTutorialApp
//
//  Created by Anthony on 22/8/25.
//

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = false

    var body: some View {
      VStack (alignment: .center, spacing: 20)  {
        Text("Home")
          .font(.largeTitle)

        Button {
          isOnboardingViewActive = true
        } label: {
          Text("Restart")
        }
      } //: VS
    }
}

#Preview {
    HomeView()
}
