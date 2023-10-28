//
//  Squares.swift
//  MoodAppDemo
//
//  Created by Fausto Pinto Cabrera on 28/10/23.
//

import Foundation
import SwiftData

@Model
final class SquareAnimal: Identifiable {
    
    var imageName: String
    var animalName: String
    var dateObtained: String
    var spriteNames: [String]
    
    init(imageName: String, animalName: String, dateObtained: String, spriteNames: [String]){
        self.imageName = imageName
        self.animalName = animalName
        self.dateObtained = dateObtained
        self.spriteNames = spriteNames
    }
}
