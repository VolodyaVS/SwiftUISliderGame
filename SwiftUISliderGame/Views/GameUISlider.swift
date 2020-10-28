//
//  UISlider.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .brown
        slider.thumbTintColor = .brown
        slider.value = Float(value)
        slider.alpha = CGFloat(alpha)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        
    }
    
    func makeCoordinator() -> GameUISlider.Coordinator {
        Coordinator(value: $value, alpha: $alpha)
    }
}

extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alpha: Double
        
        init(value: Binding<Double>, alpha: Binding<Double>) {
            self._value = value
            self._alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
            alpha = Double(sender.alpha)
        }
    }
}

struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(value: .constant(70), alpha: .constant(0.3))
    }
}
