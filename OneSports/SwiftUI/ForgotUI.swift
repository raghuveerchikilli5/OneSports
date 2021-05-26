//
//  ForgotUI.swift
//  OneSports
//
//  Created by apple on 17/05/21.
//

import SwiftUI
import Alamofire

struct ForgotUI: View {
    @State var mobileNumber = ""
    @State var otp = ""
    @State var email = false
    @State var login2:Bool = false
    var body: some View {
        NavigationView {
           
                  ZStack {
             
                  VStack(spacing: 10) {
                 
                      Text("Reset Password")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.top, -20)
                        .font(.system(size:35))
                        
                        .font(Font.headline.weight(.bold))
                    NavigationLink(destination: VerifyOTP(mobileNumber: mobileNumber) ,isActive: $login2) {
                                                                   
                       
                        
                    
                    }
                    
                    
                      Text("Pleas enter your mobile number to receive a link to create a new password via email")
                          .foregroundColor(Color.gray)
                          .multilineTextAlignment(.center)
                          .padding(.bottom, 10)
                          .font(.system(size: 16))
                        .frame(width: 330, height: 60, alignment: .center)
                      
                    TextField("  Mobile Number", text: $mobileNumber)
                                         .frame(width: 330, height: 60, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                        
                        Button(action: {
                                               print("SwiftUI: Button tapped")
                                               // Call func in SomeView()
                                              
                                               generateOTP()
                                             
                                       })
                                       {
                                               Text("Send")
                                               .frame(width: 240, height: 25, alignment: .center)
                                               .padding()
                                               .foregroundColor(.white)
                                               .background(Color.red)
                                               .cornerRadius(35)
                                                .font(.system(size:30))
                                                                       
                                                                       .font(Font.headline.weight(.bold))
                                           
                                       }
                                       .padding()
                  
                 Spacer()
                    
                  }
                    
                  
}.navigationBarTitle("")
                  .navigationBarHidden(true)
            
            Spacer()
            
        }
        
    }
    
    func generateOTP(){
        print(mobileNumber)
        login2 = true
           let headers:HTTPHeaders = [
       "Content-Type": "application/x-www-form-urlencoded",
       "Accept": "application/json",
       "version":"1.0.0",
        "source":"app"
        ]
      
        let param : Parameters  = [
       
           "mobileNumber":mobileNumber,
            
        
        ]
        print(param)
       
        
      let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/generateOTP"

        AF.request(url2, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).responseJSON {
                 response in
       
                 switch response.result {
                 case .success(let value):
                     do {
                     
                       
                        if  let data = value as? [String:Any] {
                            print("error was ",data)
                                              print("ok")
                                                   if let  result = data["success"] as? Int {
                                                       print("qwe")
                                                       if result == 1 {
                                                           login2 = true
                                                       }
                                                       
                                                       
                                                   }
                        
                        
                        
                     }
                     }
                     break
                 case .failure(let error):
                    print(error.localizedDescription)
                                    
              
     //                print("sendLatLong Err", error.localizedDescription)
                                   
                 }
             }
         
             
           }
    
    
    
    
    
    
    
    
    
    
    
    }
struct ForgotUI_Previews: PreviewProvider {
    static var previews: some View {
        ForgotUI()
    }
}
