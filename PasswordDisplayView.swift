//
//  PasswordDisplayView.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct PasswordDisplayView: View {
    let password: String
    
    var body: some View {
        Text(password)
            .font(.system(.title2, design: .monospaced))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(10)
    }
}
