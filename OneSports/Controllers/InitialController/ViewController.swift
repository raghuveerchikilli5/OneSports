//
//  ViewController.swift
//  SreenidhiSports
//
//  Created by Apple on 28/04/21.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
import Firebase

class ViewController: UIViewController {

    var currentNonce:String?
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       print("sreenidhi")
    }
    
    func updateUI()
    {
        loginBtn.layer.cornerRadius = 26
        loginBtn.layer.masksToBounds = true
        createAccountBtn.layer.cornerRadius = 26
        createAccountBtn.layer.masksToBounds = true
        createAccountBtn.layer.borderColor = #colorLiteral(red: 0.8686868687, green: 0.1299475731, blue: 0.007505266494, alpha: 0.940397351)
        createAccountBtn.layer.borderWidth = 1
    }

    
    
    func appleLogin() {
        let nonce = randomNonceString()
               currentNonce = nonce
               if #available(iOS 13.0, *) {
                   let appleIDProvider = ASAuthorizationAppleIDProvider()
                   let request = appleIDProvider.createRequest()
                          
                              request.requestedScopes = [.fullName,.email]
                                       print("@@@@@@@@@@@@@@@@@",request.nonce)
                   
                   let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                              
                              authorizationController.delegate = self
                   authorizationController.presentationContextProvider = self
                              authorizationController.performRequests()
               } else {
                   // Fallback on earlier versions
               }
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let loginVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "LoginVC") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
        
    }
    

    @IBAction func creatAccountBtn(_ sender: Any) {
        
        let createVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "CreateVC") as! CreateAccountViewController
        createVC.modalPresentationStyle = .fullScreen
        present(createVC, animated: true, completion: nil)

        
        
        
        
    }
    
}
extension ViewController: ASAuthorizationControllerDelegate {

    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
  if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
    guard let nonce = currentNonce else {
      fatalError("Invalid state: A login callback was received, but no login request was sent.")
    }
    guard let appleIDToken = appleIDCredential.identityToken else {
      print("Unable to fetch identity token")
      return
    }
    guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
      print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
      return
    }
    // Initialize a Firebase credential.
      print(nonce)
      let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                idToken: idTokenString,
                                                accessToken: nonce)

      print(credential)
    
    print(credential)
      let currentUser = Auth.auth().currentUser
    // Sign in with Firebase.
    Auth.auth().signIn(with: credential) { (user, error) in
     
        // Error. If error.code == .MissingOrInvalidNonce, make sure
        // you're sending the SHA256-hashed nonce as a hex string with
        // your request to Apple.
        
        user?.user.getIDToken(completion: { (accesstoken, error) in
                                              
                                              print("access token is ",accesstoken) //here getting access token
           
                                          })
        if  error?.localizedDescription != nil {
       
        print("this is ther",error?.localizedDescription)
        }
      // User is signed in to Firebase with Apple.
      // ...
    }
  
    if ((currentUser?.isAnonymous) != nil) {
        Auth.auth().currentUser?.link(with: credential, completion: { (result, error) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            print("ananymous user linked")
            
        })
    }
    
    
   
            
        // Apple user successfully re-authenticated.
        // ...
      }
     
      
           
 
              
    
    
  }
    
        
}
extension ViewController : ASAuthorizationControllerPresentationContextProviding {
   @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
         return self.view.window!
    }
}

//take another view controller and set scrollview with constraints 0000, and addstack view. fromstack view to contentlayout select First 4 options and fromstack view to frame layout select equal widths.
//in the below constarnt make all constaint to 0.
//take a uiview on top of that  and give height constarint.

//take a label for text login and anotherlabel for add your details to login.
//take two textfields and give constarints with height 45 and left and right 30 and add corner radius
//same with the button , height 45 , left right 30,
//and another button to forgot password? text color dark grey

// take outlets to textfields and add corner radius an
//both action and outlet for button


