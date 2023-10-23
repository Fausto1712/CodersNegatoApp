//
//  SummaryView.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 18/10/23.
//

import SwiftUI

struct OldSummaryView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    NavigationLink (destination: TaskHubView()) {
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundStyle(.blue)
                            .frame(width: 300, height: 200)
                    }
                    Text("Monthly")
                        .foregroundStyle(.white)
                }
                HStack {
                    ZStack {
                        NavigationLink (destination: SummaryView()) {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundStyle(.green)
                                .frame(width: 150, height: 100)
                        }
                        Text("Daily")
                            .foregroundStyle(.white)
                    }
                    ZStack {
                        NavigationLink (destination: SummaryView()) {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundStyle(.brown)
                                .frame(width: 150, height: 100)
                        }
                        Text("Weekly")
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                    .frame(height: 100)
                HStack {
                    VStack (alignment: .leading) {
                        Text("You are on a")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.orange)
                        HStack {
                            Text("15")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                                .foregroundStyle(.orange)
                            Text("days streak!")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.orange)
                        }
                    }
                    Spacer().frame(width: 30)
                    Image(systemName: "flame")
                        .resizable()
                        .foregroundStyle(.orange)
                        .frame(width: 40, height: 55)
                }
            }
            .navigationTitle("Summary")
        }
    }
}

#Preview {
    OldSummaryView()
}
