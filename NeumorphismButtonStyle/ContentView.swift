//
//  ContentView.swift
//  NeumorphismButtonStyle
//
//  Created by まえけん on 2021/04/15.
//  Copyright © 2021 maeken. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                NavigationLink(destination: SecondView()) {
                    Text("NextView")
                        .modifier(NeumorphismStyle(height: 50, ratio: 1.5))
                }
            }
            .navigationBarTitle("Home")
            .background(Color.offWhite)
        }
    }
}

struct SecondView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                Text("SecondView")
            }
        }
        .background(Color.offWhite)
        .navigationBarTitle("SecondView")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NeumorphismStyle: ViewModifier {
    
    var height: CGFloat
    var ratio: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(
                GeometryReader(){ geometry in
                    RoundedRectangle(cornerRadius: 30,
                                     style: .continuous)
                        .fill(Color.offWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                        .frame(width:geometry.size.width * self.ratio,
                               height: self.height)
                }
        )
    }
}
extension Color {
    static let offWhite = Color(red: 245 / 255, green: 245 / 255, blue: 255 / 255)
}
