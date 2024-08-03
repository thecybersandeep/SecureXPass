//
//  PasswordGeneratorViewModel.swift  .swift
//  SecureXPass
//
//  Created by Sandeep W on 03/08/24.
//

import Foundation
import CryptoKit

class PasswordGeneratorViewModel: ObservableObject {
    @Published var generatedPassword: String = ""
    @Published var length: Int = 16
    @Published var includeUppercase: Bool = true
    @Published var includeLowercase: Bool = true
    @Published var includeNumbers: Bool = true
    @Published var includeSpecialCharacters: Bool = true
    
    private var generator = SystemRandomNumberGenerator()
    
    init() {
        generatePassword()
    }
    
    func generatePassword() {
        let uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lowercaseLetters = "abcdefghijklmnopqrstuvwxyz"
        let numbers = "0123456789"
        let specialCharacters = "!@#$%^&*()_+-=[]{}|;:,.<>?"
        
        var allowedCharacters = ""
        if includeUppercase { allowedCharacters += uppercaseLetters }
        if includeLowercase { allowedCharacters += lowercaseLetters }
        if includeNumbers { allowedCharacters += numbers }
        if includeSpecialCharacters { allowedCharacters += specialCharacters }
        
        var password = ""
        if includeUppercase { password += String(uppercaseLetters.randomElement(using: &generator)!) }
        if includeLowercase { password += String(lowercaseLetters.randomElement(using: &generator)!) }
        if includeNumbers { password += String(numbers.randomElement(using: &generator)!) }
        if includeSpecialCharacters { password += String(specialCharacters.randomElement(using: &generator)!) }
        
        while password.count < length {
            password += String(allowedCharacters.randomElement(using: &generator)!)
        }
        
        generatedPassword = String(password.shuffled(using: &generator))
    }
    
    func calculatePasswordStrength() -> Double {
        var strength = 0.0
        let passwordLength = Double(generatedPassword.count)
        
        strength += min(passwordLength / 20.0, 1.0) * 0.3
        
        if generatedPassword.rangeOfCharacter(from: .uppercaseLetters) != nil { strength += 0.2 }
        if generatedPassword.rangeOfCharacter(from: .lowercaseLetters) != nil { strength += 0.2 }
        if generatedPassword.rangeOfCharacter(from: .decimalDigits) != nil { strength += 0.2 }
        if generatedPassword.rangeOfCharacter(from: .punctuationCharacters) != nil { strength += 0.2 }
        
        let entropy = calculateEntropy()
        strength += min(entropy / 100.0, 1.0) * 0.3
        
        return min(strength, 1.0)
    }
    
    private func calculateEntropy() -> Double {
        let characterSet = Set(generatedPassword)
        let poolSize = Double(characterSet.count)
        return Double(generatedPassword.count) * log2(poolSize)
    }
}
