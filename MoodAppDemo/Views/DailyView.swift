//
//  DailyView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import SwiftUI

struct DailyView: View {
    @State var progress: Double = 0
            
    var body: some View {
        VStack {
            // 2
            CircularProgressView(progress: 0.5)
            Text("try")
            
        }.frame(width: 200, height: 200)
    }
}

#Preview {
    DailyView()
}
