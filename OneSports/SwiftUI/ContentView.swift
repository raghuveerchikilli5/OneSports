import SwiftUI
import FBSDKLoginKit
import FirebaseAuth
import GoogleSignIn
import Firebase

struct ContentView: View {
    @AppStorage("logged") var logged = false
    @AppStorage("mail") var email = ""
    @State var loginManager = LoginManager()
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    VStack{
                        Image("Background Red Colour")
                            .resizable()
                            .scaledToFill().padding(.top)
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
                                    print("sign up bin tapped")
                                }) {
                                    
                                    
                                    Image("apple")
                                        .resizable()
                                        .frame(width: 70, height: 70, alignment: .center)
                                        
                                        
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 35)
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                }
                                
                                Button(action: {
                                    GIDSignIn.sharedInstance().clientID = "148090501583-do7o6p9vdt12i52rq5ddt3qsabvmk30d.apps.googleusercontent.com"
                                
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
        }
        .padding(0.0)
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
       print(error)
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            
            if error != nil {
                
                print(error?.localizedDescription)
            }
            
            
            print("user is",result?.user.email)
            
            
        }
        
        
      // ...
    }
    
    
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
