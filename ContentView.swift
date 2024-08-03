//
//  ContentView.swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PasswordGeneratorViewModel()
    @State private var showCopiedAlert = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Text("SecureXPass")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                PasswordDisplayView(password: viewModel.generatedPassword)
                
                PasswordStrengthMeter(strength: viewModel.calculatePasswordStrength())
                
                PasswordOptionsView(viewModel: viewModel)
                
                GenerateButton(action: viewModel.generatePassword)
                
                HStack(spacing: 20) {
                    CopyButton(password: viewModel.generatedPassword, action: { showCopiedAlert = true })
                    
                    ShareButton(password: viewModel.generatedPassword)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        .alert(isPresented: $showCopiedAlert) {
            Alert(title: Text("Copied!"), message: Text("Password copied to clipboard"), dismissButton: .default(Text("OK")))
        }
    }
}

struct PasswordStrengthMeter: View {
    let strength: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password Strength")
                .font(.caption)
                .foregroundColor(.secondary)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(.systemGray5))
                    Rectangle()
                        .fill(strengthColor)
                        .frame(width: geometry.size.width * CGFloat(strength))
                }
            }
            .frame(height: 8)
            .cornerRadius(4)
        }
    }
    
    var strengthColor: Color {
        switch strength {
        case 0..<0.3: return .red
        case 0.3..<0.6: return .orange
        case 0.6..<0.9: return .yellow
        default: return .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
