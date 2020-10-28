//
//  LabelValue.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct LabelValue: View {
    var value: Int
    
    var body: some View {
        Text("\(value)")
            .foregroundColor(.blue)
            .font(.title3)
            .frame(width: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .padding()
    }
}

struct LabelValue_Previews: PreviewProvider {
    static var previews: some View {
        LabelValue(value: 100)
    }
}
