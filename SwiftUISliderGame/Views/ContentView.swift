//
//  ContentView.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 0.0
    @State private var targetValue = 0
    @State private var showAlert = false
    @State private var alphaSlider = 0.3
    
    var body: some View {
        VStack(spacing: 20) {
            GameSlider(sliderValue: $currentValue,
                       targetValue: $targetValue,
                       alpha: $alphaSlider)
            ButtonTapped(showAlert: $showAlert,
                         title: "Проверь меня!",
                         action: { computeScore() },
                         score: computeScore() )
            ButtonTapped(showAlert: .constant(false),
                         title: "Начать заново!",
                         action: startGame,
                         score: 0)
            
        }
    }
}

extension ContentView {
    
    private func startGame() {
        let randonTargetValue = Int.random(in: 0...100)
        targetValue = randonTargetValue
    }
    
    private func computeScore() -> Int {
        showAlert = true
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
