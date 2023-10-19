//
//  Category.swift
//  A1
//
//  Created by Pietro Carnevale on 19/10/23.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    var name: String
    var details: String = ""
    var color: Color = .black
}
