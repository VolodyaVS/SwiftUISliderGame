//
//  UISlider.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .brown
        slider.thumbTintColor = .brown
        slider.value = Float(value)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(value)
        
    }
    
    func makeCoordinator() -> GameUISlider.Coordinator {
        Coordinator(value: $value)
    }
}

extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(value: .constant(70), alpha: 100, color: UIColor.brown)
    }
}
