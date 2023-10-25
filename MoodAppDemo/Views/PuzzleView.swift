//
//  ContentView.swift
//  A1
//
//  Created by Pietro Carnevale on 18/10/23.
//

import SwiftUI
import Combine

struct PuzzleView: View {
    
    var check: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, false, true, true, false, true, true, true, true, true, false, false, true, true, false, true, true, true, false]
    var trueCounter: Int = 0
    var dismiss: () -> Void
    
    var body: some View {
        ZStack{
            VStack{
                Text("Complete your daily tasks to unlock a new piece!")
                    .font(.title3)
                    .bold()
                    .padding()
                ZStack {
                    Image("AAD")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                        ForEach(1..<7) { row in
                            GridRow {
                                ForEach(1..<6) { column in
                                    if(check[5*(row - 1) + column - 1]) {
                                        Image("")
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
                }
                .border(.black)
                .padding()
                Button("CLAIM", action: {
                    //Create Animal
                })
                .disabled(trueCounter != 0)
                .foregroundStyle(Color.blue)
                .padding()
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .frame(width: 350, height: 350)
        }
        .padding()
    }
}
