//
//  ContentView.swift
//  SlidersRGBSwiftUI
//
//  Created by Nikita on 10.09.21.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = 0.0
    @State private var greenValue = 0.0
    @State private var blueValue = 0.0
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2550776632, green: 0.2105325181, blue: 0.9686274529, alpha: 1))
                .ignoresSafeArea()
            VStack {
                PresentationView(red: redValue,
                                 green: greenValue,
                                 blue: blueValue)
                
                VStack {
                    ColorSlider(value: $redValue)
                    ColorSlider(value: $greenValue)
                    ColorSlider(value: $blueValue)
                }
                .padding()
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
