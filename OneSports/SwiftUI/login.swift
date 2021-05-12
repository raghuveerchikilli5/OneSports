//
//  login.swift
//  OneSports
//
//  Created by apple on 11/05/21.
//

import SwiftUI
import Alamofire


struct login: View {
    @State var mail: String = ""
    @State var password: String = ""
    @State var login1:Bool = false
    @State var tokenMain = ""
    var body: some View {
        NavigationView {
            ZStack {
            VStack(spacing: 10) {
                Text("Login")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 0)
                    .font(.system(size: 22))
                Text("Add your details to login")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 0)
                    .font(.system(size: 12))
                
                TextField("Your Mail", text: $mail)
                .frame(width: 300, height: 50, alignment: .center)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .padding(.top,20)
                
                TextField("    Password", text: $password)
                .frame(width: 300, height: 50, alignment: .center)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .padding(.top,20)
                
                Button(action: {
                        print("SwiftUI: Button tapped")
                        // Call func in SomeView()
                    primaryAPI()
                      
                })
                {
                        Text("Login")
                        .frame(width: 270, height: 20, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(35)
                    
                    
                }
                .padding()
                
                
                
                NavigationLink(destination: login()) {
                    Text("forgot Your Passowrd?")
                        .frame(width: 270, height: 20, alignment: .center)
                        .padding(.top,0)
                        
                        .foregroundColor(.black)
                        
                        .cornerRadius(35)
                        .font(.system(size: 14))
                    
                }
                Spacer()
                HStack {
                    
                    Text("dont Have An Account?")
                        .frame(width: 152, height: 20, alignment: .center)
                       
                        
                        .foregroundColor(.black)
                        
                        .cornerRadius(35)
                        .font(.system(size: 14))
                    
                    NavigationLink(destination: login()) {
                        Text("Signup")
                            
                            
                            .padding(.leading,0)
                            .foregroundColor(.blue)
                            
                            .cornerRadius(35)
                            .font(.system(size: 14))
                            .frame(width: 50, height: 100, alignment: .center)
                    }
                   
                    
                    Spacer()
                    
                } .frame(width: 220, height: 50, alignment: .center)
                
               
            }
               
            .padding(.top,60)
                
            
            
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    }
    }
   
    func primaryAPI(){
        let param : Parameters  = [

            "userName":mail,
            "password":password
        ]
          
       
       let url1 = "https://beta.sreenidhi1sports.com/api/AppUsers/loginWithPassword"
//
     
    
        AF.request(url1, method: .post, parameters:param ,encoding: JSONEncoding.default, headers: nil).validate().responseJSON { [self]
                  response in
                
                  switch response.result {
                  case .success(let value):
                      do {
                        var data = value as? [String:Any]
                     
                       
                        if let token =  data!["token"] as? String {
                            self.tokenMain = token
                            
                            loginAPI()
                        }
                      
                      }
                      break
                  case .failure(let error):
                         
                      print("failed response ",error)
      //                print("sendLatLong Err", error.localizedDescription)
                                    
                  }
              }
    }

    func loginAPI(){
    
                let headers:HTTPHeaders = ["Authorization": tokenMain]
           let url2 = "https://beta.sreenidhi1sports.com/api/AppUsers/fetchUserDetails"
      
            AF.request(url2, method: .get, parameters:nil ,encoding: JSONEncoding.default, headers: headers).validate().responseJSON { [self]
                      response in
                    
                      switch response.result {
                      case .success(let value):
                          do {
                        
                            
                           
                            
                            if  let loginData = value as? [String:Any] {
                                login1 = true
                                print(loginData)
                            }
                          }
                          break
                      case .failure(let error):
                             
                          print("failed response ",error)
          //                print("sendLatLong Err", error.localizedDescription)
                                        
                      }
                  }
          
        }
    
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
