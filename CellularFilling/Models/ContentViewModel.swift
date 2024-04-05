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
        
        let cellArray = cells.suffix(3).map({ $0.type })
        guard cellArray.count >= 3 else { return }
        let set = Set(cells.suffix(3).map({ $0.type }))
        if set.count == 1 {
            if set.first! == .alive {
                cells.append(CellModel.getLifeCell())
            } else {
                if cells[cells.count - 3].type == .life {
                    cells.remove(at: cells.count - 3)
                    cells.insert(CellModel.getDeadCell(), at: cells.count - 3)
                }
                
            }
        }
    }
}
