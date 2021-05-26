//
//  VerifyOTP.swift
//  OneSports
//
//  Created by apple on 26/05/21.
//

import SwiftUI
import Alamofire

struct VerifyOTP: View {
    @State var mobileNumber = ""
    @State var otp = ""
    var body: some View {
        NavigationView {
           
                  ZStack {
             
                  VStack(spacing: 10) {
                 
                      Text("Verify OTP")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.top, -20)
                        .font(.system(size:35))
                        
                        .font(Font.headline.weight(.bold))
                  
                      Text("Pleas enter your OTP to receive to  Number and create  new password ")
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
                                              
                            loginOTP()
                                             
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
                    
                  
}
            
            Spacer()
            
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        
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
        
       
        
      let url2 = "https://staging.sreenidhi1sports.com/api/AppUsers/VerifyOTP"

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
                        
                    print("failed response ",error.failureReason)
     //                print("sendLatLong Err", error.localizedDescription)
                                   
                 }
             }
         
             
           }
    
    
    
    
    
    
    
    
    }
struct VerifyOTP_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTP()
    }
}
