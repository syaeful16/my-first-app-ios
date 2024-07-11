//
//  ViewExtensions.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI

extension View{
    func hAlign(_ alignment: Alignment)->some View{
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func borderField(_ width: CGFloat, _ border: Color, _ bg: Color)->some View{
        self
            .padding(.vertical, 14)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous )
                    .stroke(border, lineWidth: width)
                    .background(bg)
            )
    }
    
    func fillButton(_ bg: Color)->some View{
        self
            .padding(.vertical, 14)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous )
                    .fill(bg)
            )
    }
}
