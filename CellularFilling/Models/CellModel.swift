//
//  CellModel.swift
//  CellularFilling
//
//  Created by Vlad Vrublevsky on 05.04.2024.
//

import Foundation
import SwiftUI

struct CellModel: Identifiable, Hashable {
    enum CellType {
        case alive
        case dead
        case life
    }
    
    let id = UUID()
    let type: CellType
    
    var imageBackgroundColors: [Color]
    var imageLabel: String
    var headerText: String
    var footerText: String
    
    init() {
        self.type = (Int.random(in: 0...1) == 0) ? .alive : .dead
        
        switch type {
        case .alive:
            self.imageBackgroundColors = [.init(hex: "FFB800"), .init(hex: "FFF7B0")]
            self.imageLabel = "💥"
            self.headerText = "Живая"
            self.footerText = "и шевелится!"
        case .dead:
            self.imageBackgroundColors = [.init(hex: "0D658A"), .init(hex: "B0FFB4")]
            self.imageLabel = "💀"
            self.headerText = "Мёртвая"
            self.footerText = "или прикидывается"
        case .life:
            self.imageBackgroundColors =  [.init(hex: "AD00FF"), .init(hex: "FFB0E9")]
            self.imageLabel = "🐣"
            self.headerText = "Жизнь"
            self.footerText = "Ку-ку!"
        }
        
    }
}
