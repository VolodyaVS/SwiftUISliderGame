//
//  GameSlider.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct GameSlider: View {
    @Binding var sliderValue: Double
    @Binding var targetValue: Int
    @Binding var alpha: Double
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
            HStack {
                LabelValue(value: 0)
                GameUISlider(value: $sliderValue, alpha: $alpha)
                LabelValue(value: 100)
            }
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(sliderValue: .constant(100), targetValue: .constant(100), alpha: .constant(0.3))
    }
}
