//
//  CellView.swift
//  CellularFilling
//
//  Created by Vlad Vrublevsky on 05.04.2024.
//

import SwiftUI

struct CellView: View {
    let cellModel: CellModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .foregroundColor(.white)
            HStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: cellModel.imageBackgroundColors), startPoint: .top, endPoint: .bottom)
                    Text(cellModel.imageLabel)
                        .font(.system(size: 28))
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading, 16)
                
                VStack(alignment: .leading) {
                    Text(cellModel.headerText)
                        .font(.custom("Roboto-Medium", size: 20))
                    Text(cellModel.footerText)
                        .font(.custom("Roboto-Regular", size: 14))
                }
                .padding(.leading, 5)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()
        CellView(cellModel: .init())
            .frame(width: 328, height: 72, alignment: .center)
    }
}
