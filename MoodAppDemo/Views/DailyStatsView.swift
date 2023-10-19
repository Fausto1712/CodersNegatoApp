//
//  DailyStatsView.swift
//  A1
//
//  Created by Pietro Carnevale on 19/10/23.
//

import SwiftUI
import Charts

struct DailyStatsView: View {
    
    var categories = CategoryViewModel()
    var body: some View {
        
        NavigationStack{
            
            Chart {
                ForEach(categories.categories) { category in
                    BarMark(
                        x: .value("Category", category.name),
                        y: .value("Total Count", category.name.count)
                        )
                    .foregroundStyle(category.color)
                }
            }
            .padding()
            
            List {
                ForEach(categories.categories) { category in
                    
                    NavigationLink {
                        PuzzleView()
                    } label: {
                        VStack(alignment: .leading) {
                            Text(category.name)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(category.color)
                            Text(category.details)
                        }
                        .padding()
                    }
                    
                }
            }
            .navigationTitle("Daily")
        }
        
    }
}

#Preview {
    DailyStatsView()
}
