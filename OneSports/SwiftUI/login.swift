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
                Text(" Add your details to login")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 0)
                    .font(.system(size: 12))
                
                TextField("   Your Mail", text: $mail)
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
                         
                         NavigationLink(destination: Dashboard() ,isActive: $login1) {
                             
                         }
                         
                         NavigationLink(destination: login()) {
                             Text("Forgot Your Passowrd?")
                                 .frame(width: 270, height: 20, alignment: .center)
                                 .padding(.top,0)
                                 
                                 .foregroundColor(.black)
                                 
                                 .cornerRadius(35)
                                 .font(.system(size: 14))
                             
                         }
                         Spacer()
                         HStack {
                             
                             Text("Dont Have an Account?")
                                 .frame(width: 152, height: 20, alignment: .center)
                                
                                 
                                 .foregroundColor(.black)
                                 
                                 .cornerRadius(35)
                                 .font(.system(size: 14))
                             
                             NavigationLink(destination: SignUpView()) {
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
             }.navigationBarTitle("")
                 .navigationBarHidden(true)
             }
            
             func primaryAPI(){
                 let param : Parameters  = [

                     "userName":mail,
                     "password":password
                 ]
                 let headers:HTTPHeaders = [
                     "Content-Type": "application/x-www-form-urlencoded",
                     "Accept": "application/json",
                     "version":"1.0.0",
                     "source":"app"
                 ]
                
                let url1 = "https://staging.sreenidhi1sports.com/api/AppUsers/loginWithPassword"
         //
                  print(param)
             
                 AF.request(url1, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
                           response in
                         
                           switch response.result {
                           case .success(let value):
                               do {
                                 var data = value as? [String:Any]
                                 print(data)
                                
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
         //        let param : Parameters  = [
         //              "userName":"9133117471",
         //              "password":"Sree@123"
         //
         //                               ]
         //
             }

             func loginAPI(){
                 let headers:HTTPHeaders = ["Authorization": tokenMain,
             "Content-Type": "application/x-www-form-urlencoded",
             "Accept": "application/json",
             "version":"1.0.0",
                                 "source":"app"
                 
                 
                 
                 ]
            let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/fetchUserDetails"

             AF.request(url2, method: .get, parameters:nil ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
                       response in
                     
                       switch response.result {
                       case .success(let value):
                           do {
                         
                            
                             DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                                  
                                 login1 = true
                                                   
                                               }
                                               
                             
                             var data = value as? [String:Any]
                             print(data)
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
