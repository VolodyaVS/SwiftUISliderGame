//
//  Button.swift
//  SwiftUISliderGame
//
//  Created by Vladimir Stepanchikov on 27.10.2020.
//

import SwiftUI

struct ButtonTapped: View {
    @Binding var showAlert: Bool

    var title: String
    var action: () -> Void
    var score: Int
    

    var body: some View {

        Button(action: action) {
            Text("\(title)")
                .font(.title2)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Your Score"),
                message: Text("\(score) %")
            )}
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTapped(showAlert: .constant(false),
                     title: "hello",
                     action: {},
                     score: 60)
    }
}
