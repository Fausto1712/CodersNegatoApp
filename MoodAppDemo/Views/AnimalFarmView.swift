//
//  ContentView.swift
//  AnimalsTest
//
//  Created by Fausto Pinto Cabrera on 19/10/23.
//

import SwiftUI
import SwiftData

struct AnimalFarmView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var animals: [SquareAnimal]
    
    @State var squares: [Square] = []
    @Binding var newAnimalName: String
    
    var body: some View {
        VStack {
            Spacer()
            MovingSquareView(squares: $squares)
            Spacer()
        }.onAppear(perform: addSquareAnimals)
            .onChange(of: newAnimalName) {animalClaim()}
    }
    
    private func animalClaim() -> Void {
        if newAnimalName != ""{
            modelContext.insert(SquareAnimal(imageName: "AAD", animalName: newAnimalName, dateObtained: Date().formatted(date: .long, time: .shortened), spriteNames: ["AAD","AAH","AAR","AAU"]))
            newAnimalName = ""
            
            var newSquare = Square()
            newSquare.imageName = "AAD"
            newSquare.animalName = newAnimalName
            newSquare.dateObtained = Date().formatted(date: .long, time: .shortened)
            newSquare.spriteNames = ["AAD","AAH","AAR","AAU"]
            squares.append(newSquare)
        }
    }
    
    private func addSquareAnimals() -> Void {
        if (animals.isEmpty) {
            modelContext.insert(SquareAnimal(imageName: "ABD", animalName: "Rodolfo", dateObtained: "28/10/2023 - 12:05", spriteNames: ["ABD","ABH","ABR" ,"ABU"]))
            modelContext.insert(SquareAnimal(imageName: "ASD", animalName: "Jacinto", dateObtained: "15/10/2023 - 12:25", spriteNames: ["ASD","ASH","ASR","ASU"]))
            modelContext.insert(SquareAnimal(imageName: "BMD", animalName: "Paco", dateObtained: "12/10/2023 - 12:33", spriteNames: ["BMD","BMH","BMR","BMU"]))
            modelContext.insert(SquareAnimal(imageName: "AVD", animalName: "Maximiliano", dateObtained: "28/10/2023 - 2:42", spriteNames: ["AVD","AVH","AVR","AVU"]))
            modelContext.insert(SquareAnimal(imageName: "AWD", animalName: "Kuko", dateObtained: "11/10/2023 - 8:05", spriteNames: ["AWD","AWH","AWR","AWU"]))
        }
        /*
        for i in 0...animals.count-1 {
            var newSquare = Square()
            newSquare.imageName = animals[i].imageName
            newSquare.animalName = animals[i].animalName
            newSquare.dateObtained = animals[i].dateObtained
            newSquare.spriteNames = animals[i].spriteNames
            squares.append(newSquare)
        }*/
    }
}

/*#Preview {
    AnimalFarmView(, isAnimalClaimed: true)
        .modelContainer(for: SquareAnimal.self, inMemory: true)
}*/

struct MovingSquareView: View {
    @Binding var squares: [Square]
    @State private var showOverlay = false
    
    @State private var isModalPresented: Bool = false
    @State private var selectedSquare: Square?
    
    var body: some View {
        ZStack {
            Image("Back1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .padding(20)
            ForEach($squares) { squareBinding in
                Rectangle()
                    .overlay(
                        Image(showOverlay ? squareBinding.wrappedValue.imageName : squareBinding.wrappedValue.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipped()
                    )
                    .foregroundColor(.black.opacity(0))
                    .position(squareBinding.wrappedValue.position)
                    .onTapGesture {
                        self.selectedSquare = squareBinding.wrappedValue
                        self.isModalPresented = true
                    }
                    .onAppear {
                        self.moveRandomly(for: squareBinding)
                    }
            }
        }
        .sheet(isPresented: $isModalPresented) {
            if let selectedSquare = self.selectedSquare {
                SquareDetailModal(square: selectedSquare, isModalPresented: $isModalPresented)
            }
        }
    }
    
    func moveRandomly(for square: Binding<Square>) {
        
        var randomX = square.wrappedValue.position.x
        var randomY = square.wrappedValue.position.y
        
        if (Bool.random()){
            randomX = CGFloat.random(in: 30...(350))
        } else {
            randomY = CGFloat.random(in: 34...(195))
        }
        
        if(randomX != square.wrappedValue.position.x){
            if(randomX > square.wrappedValue.position.x){
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[2]
            } else {
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[1]
            }
        } else {
            if(randomY > square.wrappedValue.position.y){
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[0]
            } else {
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[3]
            }
        }
        self.showOverlay.toggle()
        
        withAnimation(.linear(duration: 3.0)) {
            square.wrappedValue.position = CGPoint(x: randomX, y: randomY)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.moveRandomly(for: square)
        }
    }
}

struct SquareDetailModal: View {
    @State private var newName: String = ""
    var square: Square
    @Binding var isModalPresented: Bool
    
    var body: some View {
        VStack {
            Text("Animal Details")
                .font(.title)
                .padding()
            
            Text(square.animalName)
                .padding()
                .font(.title2)
                .background(Color.white)
                .cornerRadius(8)
            
            Text("Date Obtained: \(square.dateObtained)")
                .padding()
                .font(.title2)
            
            Spacer()
            
            Image(square.spriteNames[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .clipped()
            
            Spacer()
            
            Button(action: {
                self.isModalPresented = false
            }) {
                Text("Close")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct Square: Identifiable {
    let id = UUID()
    var position: CGPoint = CGPoint(x: 200, y: 120)
    var imageName: String = "AAD"
    var animalName: String = "Paco"
    var dateObtained: String = Date().formatted(date: .long, time: .shortened)
    var spriteNames: [String] = ["AAD","AAH","AAR","AAU"]
    
    /*init() {
        self._spriteNames = Binding.constant([
            ["AAD","AAH","AAR","AAU"],
            ["ABD","ABH","ABR" ,"ABU"],
            ["AMD","AMH","AMR","AMU"],
            ["ASD","ASH","ASR","ASU"],
            ["AVD","AVH","AVR","AVU"],
            ["AWD","AWH","AWR","AWU"],
            ["BAD","BAH","BAR","BAU"],
            ["BBD","BBH","BBR","BBU"],
            ["BMD","BMH","BMR","BMU"],
            ["BSD","BSH","BSR","BSU"],
            ["BVD","BVH","BVR","BVU"],
            ["BWD","BWH","BWR","BWU"],
            ["CAD","CAH","CAR","CAU"],
            ["CBD","CBH","CBR","CBU"],
            ["CMD","CMH","CMR","CMU"],
            ["CWD","CWH","CWR","CWU"],
            ["DAD","DAH","DAR","DAU"],
            ["DMD","DMH","DMR","DMU"],
            ["DWD","DWH","DWR","DWU"],
            ["FMD","FMH","FMR","FMU"],
            ["FWD","FWH","FWR","FWU"],
            ["GMD","GMH","GMR","GMU"],
            ["GWD","GWH","GWR","GWU"]
        ].randomElement() ?? ["ABD","ABH","ABR","ABU"])
    }*/
}
