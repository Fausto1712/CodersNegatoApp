//
//  ContentView.swift
//  A1
//
//  Created by Pietro Carnevale on 18/10/23.
//

import SwiftUI

struct PuzzleView: View {
    
    var check: [Bool] = [true, false, false, true, true, false, true, true, true, false, true, false, false, true, true, false, true, true, true, false, true, false, false, true, true, false, true, true, true, false]
    var trueCounter: Int = 0
    
    var body: some View {
        NavigationStack{
            Text("Complete your daily tasks to unlock a new piece!")
                .font(.title3)
                .bold()
            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                ForEach(1..<7) { row in
                    GridRow {
                        ForEach(1..<6) { column in
                            if(check[5*(row - 1) + column - 1]) {
                                Image("fox\(5*(row - 1) + column)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image("locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
            }
            .padding()
            Button("CLAIM", action: {
                //Insert code for claiming your prize here.
            })
            .disabled(trueCounter != 30)
            .navigationTitle("Puzzle")
        }
    }
}

#Preview {
    PuzzleView()
}
