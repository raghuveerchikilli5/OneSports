//
//  LoginViewModel.swift
//  OneSports
//
//  Created by apple on 25/05/21.
//

import Foundation
import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var nonce = ""
    
    
    func authnticate(credentials:ASAuthorizationAppleIDCredential){
        guard let token = credentials.identityToken else {
            
            print("error with direbase")
            
            return
        }
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("error with token")
            return
            
        }
        
        
        let firebaseCrede = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, accessToken: nonce)
        Auth.auth().signIn(with: firebaseCrede) { (result, err) in
            if let error = err {
                
                print(error.localizedDescription)
            }
            print("login in scussess")
        }
        
        
        
    }
}

@available(iOS 13, *)
 func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    return String(format: "%02x", $0)
  }.joined()

  return hashString
}

// Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
 func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: Array<Character> =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}
