//
//  ContentView.swift
//  CellularFilling
//
//  Created by Vlad Vrublevsky on 05.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var cells: [CellModel] = [CellModel(), CellModel()]
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(hex: "310050"), .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Клеточное наполнение")
                    .foregroundColor(.white)
                    .font(.custom("Roboto-Medium.ttf", size: 28))
                
                ScrollView() {
                    ScrollViewReader { proxy in
                        ForEach(cells, id: \.id) { cell in
                            CellView(cellModel: cell)
                                .id(cell.id)
                                .frame(height: 72)
                        }
                        .onAppear {
                            scrollProxy = proxy
                        }
                        Spacer()
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
            .onChange(of: cells, perform: { _ in
                scrollToBottom()
            })
        }
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(cells.last?.id, anchor: .bottom)
        }
    }
    
    func createNewCell() {
        cells.append(.init())
    }
}

#Preview {
    ContentView()
}
