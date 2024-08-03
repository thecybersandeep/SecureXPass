//
//  ShareButton.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct ShareButton: View {
    let password: String
    
    var body: some View {
        Button(action: {
            let activityVC = UIActivityViewController(activityItems: [password], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }) {
            Label("Share", systemImage: "square.and.arrow.up")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}
