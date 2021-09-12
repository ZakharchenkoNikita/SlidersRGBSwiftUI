//
//  ColorSlider.swift
//  SlidersRGBSwiftUI
//
//  Created by Nikita on 12.09.21.
//

import SwiftUI

enum TextFieldErrors: String {
    case minValue = "Вводимое значение не должно быть отрицательным"
    case maxValue = "Вводимое значение не должно быть больше 255"
}

struct ColorSlider: View {
    @State private var alertPresented = false
    @State private var error = TextFieldErrors.minValue
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40, height: 10)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255)
            textField
        }
    }
    
    private var textField: some View {
        TextField("Value", value: $value,
                       formatter: formatter,
                       onCommit: { validateTF() })
            .frame(width: 60, height: 30)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numbersAndPunctuation)
            .alert(isPresented: $alertPresented, content: {
                Alert(title: Text("Error"),
                      message: Text(error.rawValue))
            })
    }
    
    private let formatter: Formatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
    private func validateTF() {
        if value < 0 {
            error = .minValue
            alertPresented.toggle()
            value = 0
        } else if value > 255 {
            error = .maxValue
            alertPresented.toggle()
            value = 0
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(20))
    }
}
