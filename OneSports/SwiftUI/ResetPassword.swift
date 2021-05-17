//
//  ResetPassword.swift
//  OneSports
//
//  Created by apple on 17/05/21.
//

import SwiftUI
import Alamofire

struct ResetPassword: View {
    @State var mobileNumber = ""
    var body: some View {
        NavigationView {
           
                  ZStack {
             
                  VStack(spacing: 10) {
                 
                      Text("New Password")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.top, -20)
                        .font(.system(size:35))
                        
                        .font(Font.headline.weight(.heavy))
                  
                      Text("Pleas enter your mobile number to receive a link to create a new password via email")
                          .foregroundColor(Color.gray)
                          .multilineTextAlignment(.center)
                          .padding(.bottom, 0)
                          .font(.system(size: 16))
                        .frame(width: 330, height: 60, alignment: .center)
                      
                    TextField("  New Password", text: $mobileNumber)
                                         .frame(width: 330, height: 60, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 1)
                                             )
                                             .padding(.top,10)
                    TextField("  Confirm Password", text: $mobileNumber)
                                         .frame(width: 330, height: 60, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 1)
                                             )
                                             .padding(.top,20)
                    
                    
                    Text("Include both lower and upper case characters Include at least one number or symbol be at least 8 characters long")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                        .font(.system(size: 16))
                      .frame(width: 330, height: 80, alignment: .center)
                    
                    
                    
                    
                        Button(action: {
                                               print("SwiftUI: Button tapped")
                                               // Call func in SomeView()
                                               generateOTP()
                                             
                                       })
                                       {
                                               Text("Next")
                                               .frame(width: 240, height: 25, alignment: .center)
                                               .padding()
                                               .foregroundColor(.white)
                                               .background(Color.red)
                                               .cornerRadius(35)
                                                .font(.system(size:30))
                                                                       
                                                                       .font(Font.headline.weight(.bold))
                                           
                                       }
                        .padding(.top,-5)
                  
                 Spacer()
                    
                  }
                    
                  
}
            
            Spacer()
            
        }
        
    }
    
    func generateOTP(){
           let headers:HTTPHeaders = [
       "Content-Type": "application/x-www-form-urlencoded",
       "Accept": "application/json",
       "version":"1.0.0",
        "source":"app"
        ]
      
        let param : Parameters  = [
       
           "mobileNumber":mobileNumber,
        
        ]
        
       
        
      let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/generateOTP"

       AF.request(url2, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON {
                 response in
               
                 switch response.result {
                 case .success(let value):
                     do {
                     
                       
                        if  let data = value as? Any {
                       
                         
                            print(data)
                            
                            
                        }
                        
                        
                        
                     }
                     break
                 case .failure(let error):
                        
                     print("failed response ",error)
     //                print("sendLatLong Err", error.localizedDescription)
                                   
                 }
             }
         
             
           }
    
    
    func loginOTP(){
           let headers:HTTPHeaders = [
       "Content-Type": "application/x-www-form-urlencoded",
       "Accept": "application/json",
       "version":"1.0.0",
        "source":"app"
        ]
      
        let param : Parameters  = [
       
           "mobileNumber":mobileNumber,
        
        ]
        
       
        
      let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/loginOTP"

       AF.request(url2, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON {
                 response in
               
                 switch response.result {
                 case .success(let value):
                     do {
                     
                       
                        if  let data = value as? Any {
                       
                         
                            print(data)
                            
                            
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

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
