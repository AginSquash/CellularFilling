//
//  ContentView.swift
//  CellularFilling
//
//  Created by Vlad Vrublevsky on 05.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var cells: [CellModel] = [CellModel(), CellModel()]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(hex: "310050"), .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Клеточное наполнение")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium.ttf", size: 28))
                
                ScrollView(.vertical) {
                    ForEach(cells) { cell in
                        CellView(cellModel: cell)
                            .frame(height: 72)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                        .foregroundColor(.init(hex: "5A3472"))
                    Text("сотворить".uppercased())
                        .foregroundStyle(.white)
                        .font(.custom("Roboto-Medium.ttf", size: 14))
                }
                .frame(height: 36)
                .onTapGesture(perform: createNewCell)
            }
            .padding()
        }
    }
    
    func createNewCell() {
        cells.append(.init())
    }
}

#Preview {
    ContentView()
}
