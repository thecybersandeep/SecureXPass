//
//  GenerateButton.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct GenerateButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Generate Password")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
}
