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
    var type: CellType
    
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
        default:
            self.imageBackgroundColors = [.init(hex: "0D658A"), .init(hex: "B0FFB4")]
            self.imageLabel = "💀"
            self.headerText = "Мёртвая"
            self.footerText = "или прикидывается"
        }
    }
    
    static func getLifeCell() -> CellModel {
        var cell = CellModel()
        cell.type = .life
        cell.imageBackgroundColors =  [.init(hex: "AD00FF"), .init(hex: "FFB0E9")]
        cell.imageLabel = "🐣"
        cell.headerText = "Жизнь"
        cell.footerText = "Ку-ку!"
        return cell
    }
    
    static func getDeadCell() -> CellModel {
        var cell = CellModel()
        cell.type = .dead
        cell.imageBackgroundColors = [.init(hex: "0D658A"), .init(hex: "B0FFB4")]
        cell.imageLabel = "💀"
        cell.headerText = "Мёртвая"
        cell.footerText = "или прикидывается"
        return cell
    }
}
