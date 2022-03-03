//
//  PrimaryButtonStyle.swift
//  Socialcademy
//
//  Created by Mirna Helmy on 3/3/22.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
 
    func makeBody(configuration: Configuration) -> some View {
        Group {
            if isEnabled {
                configuration.label
            } else {
                ProgressView()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .animation(.default, value: isEnabled)
    }
}



