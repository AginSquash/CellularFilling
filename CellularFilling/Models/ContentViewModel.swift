//
//  ContentViewModel.swift
//  CellularFilling
//
//  Created by Vlad Vrublevsky on 05.04.2024.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    @Published var cells = [CellModel]()
    
    func addICellsToArray() {
        cells.append(.init())
        
        checkNewArray()
    }
    
    func checkNewArray() {
        guard cells.count >= 3 else { return }
        let set = Set(cells.suffix(3).map({ $0.type }))
        
        if set.count == 1 {
            if set.first! == .alive {
                cells.append(CellModel.getLifeCell())
            } else {
                guard cells.count >= 4 else { return }
                if cells[cells.count - 4].type == .life {
                    cells.remove(at: cells.count - 4)
                    cells.insert(CellModel.getDeadCell(), at: cells.count - 3)
                }
                
            }
        }
    }
}
