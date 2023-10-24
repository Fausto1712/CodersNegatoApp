//
//  SplashScreenView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 24/10/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                SummaryView()
            } else {
                Rectangle()
                    .background(.white)
                Image("Team")
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
