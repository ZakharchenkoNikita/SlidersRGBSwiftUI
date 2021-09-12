//
//  PresentationView.swift
//  SlidersRGBSwiftUI
//
//  Created by Nikita on 10.09.21.
//

import SwiftUI

struct PresentationView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: UIScreen.main.bounds.width * 0.9 ,
                   height: UIScreen.main.bounds.height * 0.2)
            .foregroundColor(Color(red: red / 255,
                                   green: green / 255,
                                   blue: blue / 255))
            .shadow(color: Color(red: red / 255,
                                 green: green / 255,
                                 blue: blue / 255),
                    radius: 10, y: 1)
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView(red: 134, green: 124, blue: 1)
    }
}
