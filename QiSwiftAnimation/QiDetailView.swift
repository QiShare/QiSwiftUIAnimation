//
//  QiDetailView.swift
//  QiSwiftAnimation
//
//  Created by wangyongwang on 2019/11/20.
//  Copyright © 2019 QiShare. All rights reserved.
//

import UIKit
import SwiftUI

struct QiDetailView: View {
    
    var body: some View {
    VStack {
        HStack {
    
        Button(action: {
        withAnimation (.easeInOut(duration: 2.0)){
        self.changePosition.toggle()
        }
        }) {
            Text("位置")
            .offset(x: changePosition ? offsetX2 : offsetX1, y: changePosition ? offsetY2 : offsetY1)
            .frame(width: 100.0, height: 100.0, alignment: .center)
            .foregroundColor(changePosition ? foreColor2 : foreColor1)
            .background(changePosition ? backColor2 : backColor1)
            .opacity(changePosition ? 0.5 : 1.0)
            .cornerRadius(changePosition ? cornerR2 : cornerR1)
            .padding()
            .rotationEffect(.degrees(changePosition ? 90 : 0))
            .animation(.easeInOut(duration: 2.0))
        }
    }
}
