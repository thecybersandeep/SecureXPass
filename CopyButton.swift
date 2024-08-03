//
//  CopyButton.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct CopyButton: View {
    let password: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            UIPasteboard.general.string = password
            action()
        }) {
            Label("Copy", systemImage: "doc.on.doc")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
