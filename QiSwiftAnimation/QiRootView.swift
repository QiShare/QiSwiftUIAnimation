//
//  QiRootView.swift
//  QiSwiftAnimation
//
//  Created by wangyongwang on 2019/11/20.
//  Copyright © 2019 QiShare. All rights reserved.
//

import UIKit
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.move(edge: .trailing)
    }
    static var moveAndFadeLeading: AnyTransition {
        AnyTransition.move(edge: .leading)
    }
    static var moveAndFadeUp: AnyTransition {
        AnyTransition.move(edge: .top)
    }
    static var moveAndFadeBottom: AnyTransition {
        AnyTransition.move(edge: .bottom)
    }
}

struct QiRootView: View {
    
    @State private var changeAnimation = false
    private var offsetX1: CGFloat = 0.0
    private var offsetY1: CGFloat = 0.0
    private var offsetX2: CGFloat = 20.0
    private var offsetY2: CGFloat = 20.0
    
    private var cornerR1: CGFloat = 0.0
    private var cornerR2: CGFloat = 50.0
    
    private var foreColor1 = Color.blue
    private var foreColor2 = Color.white
    
    private var backColor1 = Color.gray
    private var backColor2 = Color.black
    
    @State private var showDetail = false
    @State private var showDetail2 = false
    @State private var showDetail3 = false
    @State private var showDetail4 = false
    @State private var showDetail5 = false
    
    var body: some View {
        VStack {
           
            HStack {
                
                Button(action: {
                                   withAnimation (.easeInOut(duration: 2.0)){
                                       self.changeAnimation.toggle()
                                   }
                    }) {
                                
                                  Text("位置")
                                    .offset(x: changeAnimation ? offsetX2 : offsetX1, y: changeAnimation ? offsetY2 : offsetY1)
                                    .frame(width: 100.0, height: 100.0, alignment: .center)
                                    .foregroundColor(changeAnimation ? foreColor2 : foreColor1)
                                    .background(changeAnimation ? backColor2 : backColor1)
                                    .opacity(changeAnimation ? 0.5 : 1.0)
                                    .cornerRadius(changeAnimation ? cornerR2 : cornerR1)
                                    .padding()
                                    .rotationEffect(.degrees(changeAnimation ? 90 : 0))
                                    .animation(.easeInOut(duration: 2.0))
                              }
                
                Button(action: {
                               withAnimation (.easeInOut(duration: 2.0)){
                                   self.showDetail.toggle()
                               }
                }) {
                             Image(systemName: "chevron.right.circle")
                                .imageScale(.large)
                                .rotationEffect(.degrees(showDetail ? 90 : 0))
                                .opacity(showDetail ? 0.5 : 1.0)
                                .scaleEffect(showDetail3 ? 1.5 : 1.0)
                                .padding()
                          }
            }
            
            HStack {

                // easeInOut
                Button(action: {
                    withAnimation (.easeInOut(duration: 2.0)){
                        self.showDetail.toggle()
                    }
                }) {
                    Text("trailing")
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                        .animation(.easeInOut(duration: 2.0))
                }

                // spring
                Button(action: {
                    withAnimation (.easeInOut(duration: 2.0)){
                        self.showDetail2.toggle()
                    }
                }) {
                    Text("leading")
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail2 ? 1.5 : 1.0)
                        .padding()
                        .animation(.spring())
                }

                // animation nil
                Button(action: {
                        withAnimation (.easeInOut(duration: 2.0)){
                            self.showDetail3.toggle()
                        }
                           }) {
                                Text("Top")
                               Image(systemName: "chevron.right.circle")
                                   .imageScale(.large)
                                   .rotationEffect(.degrees(showDetail ? 90 : 0))
                                .animation(nil)
                                .scaleEffect(showDetail3 ? 1.5 : 1.0)
                                .padding()
                                .animation(.spring())
                           }
                Button(action: {
                    withAnimation (.easeInOut(duration: 4.0)){
                        self.showDetail4.toggle()
                    }
                       }) {
                        Text("bottom")
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .animation(nil)
                            .scaleEffect(showDetail4 ? 1.5 : 1.0)
                            .padding()
                            .animation(.spring())
                       }
            }
            if showDetail {
                ContentView()
                    .transition(.moveAndFade)
            }
            if showDetail2 {
                ContentView()
                    .transition(.moveAndFadeLeading)
            }
            if showDetail3 {
                ContentView()
                    .transition(.moveAndFadeUp)
            }
            if showDetail4 {
                 ContentView()
                    .transition(.moveAndFadeBottom)
                // GraphCapsule(index: 0, height: 150, range: 10..<50, overallRange: 0..<100)
            }
            if showDetail5 {
                Badge()
            }
        }
    }
}
