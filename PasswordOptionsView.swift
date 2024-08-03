//
//  PasswordOptionsView.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct PasswordOptionsView: View {
    @ObservedObject var viewModel: PasswordGeneratorViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Toggle("Uppercase (A-Z)", isOn: $viewModel.includeUppercase)
            Toggle("Lowercase (a-z)", isOn: $viewModel.includeLowercase)
            Toggle("Numbers (0-9)", isOn: $viewModel.includeNumbers)
            Toggle("Symbols (!@#$)", isOn: $viewModel.includeSpecialCharacters)
            
            HStack {
                Text("Length: \(viewModel.length)")
                Slider(value: Binding(
                    get: { Double(viewModel.length) },
                    set: { viewModel.length = Int($0) }
                ), in: 8...32, step: 1)
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
    }
}
