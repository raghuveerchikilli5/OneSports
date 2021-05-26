import SwiftUI
import FBSDKLoginKit
import FirebaseAuth
import GoogleSignIn
import Firebase
import AuthenticationServices







struct ContentView: View {
    @StateObject var loginData = LoginViewModel()
    @AppStorage("logged") var logged = false
    @AppStorage("mail") var email = ""
    @State var loginManager = LoginManager()
    @State var loginApple = ViewController()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
            ZStack {
                VStack {
                    VStack{
                        Image("Background Red Colour")
                            .resizable()
                            .scaledToFill().padding(.top,0)
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight:250)
                            
                            .edgesIgnoringSafeArea(.all)
                        
                        
                    }
                    VStack {
                        VStack(alignment: .center) {
                            Image("logo_1")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 260, height: 200, alignment: .center)
                                .scaledToFit()
                                
                                .padding(.top, -100)
                            
                        }
                        VStack(spacing: 30) {
                            
                            Text("Discover best sports academy from over 1000 sports academy ")
                                .frame(width: 300, height: 50, alignment: .center)
                                .multilineTextAlignment(.center)
                            
                            
                            
                            
                            
                            
                            NavigationLink(destination: login()) {
                                Text("Login")
                                    .frame(width: 300, height: 30, alignment: .center)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(35)
                                
                                
                            }
                            .padding()
                            
                            
                            
                            NavigationLink(destination: SignUpView()) {
                                                         Text("Create an Account")
                                                         .frame(width: 300, height: 30, alignment: .center)
                                                         .padding()
                                                        .foregroundColor(.white)
                                                     .background(Color.red)
                                                         .cornerRadius(35)
                                                                                         
                                                                                         
                                                    }.padding(.top,-10)
                            
                            Text("Or login with")
                                .frame(width: 300, height: 50, alignment: .center)
                                .multilineTextAlignment(.center)
                            
                            HStack(alignment: .center, spacing: 30) {
                                Button(action: {
                                    
                                    if logged {
                                        loginManager.logOut()
                                        email = ""
                                        logged = false
                                    }
                                    else {
                                        
                                        loginManager.logIn(permissions: ["public_profile","email"], from: nil) { (result, error) in
                                            if error != nil {
                                                
                                                print(error!.localizedDescription)
                                            }
                                            
                                            if !result!.isCancelled {
                                                logged = true
                                           let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, age_range, picture.width(400), gender"])
                                              
                                                 request.start { (_, res, _) in
                                                     
                                                     guard let profileData = res as? [String:Any] else {return}
                                                     
                                                    print(profileData)
                                                     email = profileData["email"] as! String
                                                     
                                                     print(email)
                                                     
                                                 }
                                            }
                                            
                                            
                                        }
                                    }
                                    
                                    print("sign up bin tapped")
                                }) {
                                    
                                    
                                    Image("facebook")
                                        .resizable()
                                        .frame(width: 70, height: 70, alignment: .center)
                                        
                                        
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 35)
                                                .stroke(Color.blue, lineWidth: 2)
                                        )
                                }
                                
                                Button(action: {
                                
                                    loginApple.appleLogin()
                                    
                                    print("apple sign in")
                                }) {
                                    
                                    
                                        Image("apple")
                                        .resizable()
                                        .frame(width: 80, height: 70, alignment: .center)
                                        
                                        
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 35)
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                }
                              

 
                                    
                               
                                
                                Button(action: {
                                    GIDSignIn.sharedInstance().clientID = "439464976399-k3jqb96ijett0dihbgqhj5k5tpvk5i00.apps.googleusercontent.com"
                                
                                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
                                    GIDSignIn.sharedInstance()?.signIn()
                                    
                                    
                                    
                                    print("sign up bin tapped ggol")
                                }) {
                                    
                                    
                                    Image("Google")
                                        .resizable()
                                        .frame(width: 70, height: 70, alignment: .center)
                                        
                                        
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 35)
                                                .stroke(Color.red, lineWidth: 2)
                                        )
                                }  
                                
                            }
                            
                            
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .padding(0.0)
    }
    
    private func showAppleLogin() {
      // 1
      let request = ASAuthorizationAppleIDProvider().createRequest()

      // 2
      request.requestedScopes = [.fullName, .email]

      // 3
      let controller = ASAuthorizationController(authorizationRequests: [request])
    }

    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 1
final class SignInWithApple: UIViewRepresentable {
  // 2
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    // 3
    return ASAuthorizationAppleIDButton()
  }
  
  // 4
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
class AppleSignInCoordinator: NSObject, ASAuthorizationControllerDelegate {
    // Backend Service Variable
   
    
    // Shows Sign in with Apple UI
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // Delegate methods
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // Get user details
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email ?? ""
            let name = (fullName?.givenName ?? "") + (" ") + (fullName?.familyName ?? "")
            
            // Save user details or fetch them
            // Sign in with Apple only gives full name and email once
            // Below is a sample code of how it can be done
            
            // Example: Make network request to backend
            // OR, perform any other operation as per your app's use case
          
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

