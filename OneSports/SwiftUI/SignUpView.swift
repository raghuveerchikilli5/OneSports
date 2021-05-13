//
//  SignUpView.swift
//  OneSports
//
//  Created by apple on 12/05/21.
//

import SwiftUI
import Alamofire

struct SignUpView: View {
    @State var mail: String = ""
    @State  var loginT:Bool = false

               @State var login1:Bool = false
               @State var tokenMain = ""
    @State var name = ""
    @State var mobileNumber = ""
    @State var email = ""
    @State var gender = ""
    @State var password = ""
    @State var qualifications = ""
    @State var dateofbirth = ""
    @State var bloodgroup = ""
    @State var dominantside = ""
    @State var schoolName = ""
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical) {
                    
                   
               
            
                  ZStack {
             
                  VStack(spacing: 10) {
                    Group {
                      Text("Signup")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.top, 0)
                        .font(.system(size:25))
                        
                        .font(Font.headline.weight(.bold))
                          
                  
                    
                      Text("Add your details to SignUp")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.bottom, 10)
                          .font(.system(size: 12))
                      
                      TextField("     Name", text: $name)
                      .frame(width: 330, height: 55, alignment: .center)
                          .overlay(
                              RoundedRectangle(cornerRadius: 35)
                                  .stroke(Color.gray, lineWidth: 2)
                          )
                          .padding(.top,20)
                        
                          .padding(.top,20)
                      
                    TextField("     Mobile Number", text: $mobileNumber)
                                         .frame(width: 330, height: 55, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                                         
                    TextField("     Gender", text: $gender)
                                         .frame(width: 330, height: 55, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                      
                    TextField("   Password", text: $password)
                               .frame(width: 330, height: 55, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,20)
                               
                               TextField("    Qualifications", text: $qualifications)
                               .frame(width: 330, height: 55, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,20)
                               
                             TextField("   Dateofbirth", text: $dateofbirth)
                                                  .frame(width: 330, height: 55, alignment: .center)
                                                      
                                                      .overlay(
                                                          RoundedRectangle(cornerRadius: 35)
                                                              .stroke(Color.gray, lineWidth: 2)
                                                      )
                                                      .padding(.top,20)
                                                  
                 
                        VStack {
                            
                            NavigationLink(destination: Dashboard() ,isActive: $loginT) {
                                              
                                          }
                            
                            
                            
                                           TextField("   Bloodgroup", text: $bloodgroup)
                                                                                                             .frame(width: 330, height: 55, alignment: .center)
                                                                                                                 
                                                                                                                 .overlay(
                                                                                                                     RoundedRectangle(cornerRadius: 35)
                                                                                                                         .stroke(Color.gray, lineWidth: 2)
                                                                                                                 )
                                                                                                                 .padding(.top,20)
                            
                            TextField("   Dominantside", text: $dominantside)
                                                                                              .frame(width: 330, height: 55, alignment: .center)
                                                                                                  
                                                                                                  .overlay(
                                                                                                      RoundedRectangle(cornerRadius: 35)
                                                                                                          .stroke(Color.gray, lineWidth: 2)
                                                                                                  )
                                                                                                  .padding(.top,20)
                            TextField(" SchoolName", text: $schoolName)
                                                 .frame(width: 330, height: 55, alignment: .center)
                                                     
                                                     .overlay(
                                                         RoundedRectangle(cornerRadius: 35)
                                                             .stroke(Color.gray, lineWidth: 2)
                                                     )
                                .padding(.top,20)
                            
                            Button(action: {
                                                   print("SwiftUI: Button tapped")
                                                   // Call func in SomeView()
                                register()
                                                 
                                           })
                                           {
                                                   Text("Sign Up")
                                                   .frame(width: 270, height: 20, alignment: .center)
                                                   .padding()
                                                   .foregroundColor(.white)
                                                   .background(Color.red)
                                                   .cornerRadius(35)
                                                    .font(.system(size:25))
                                                                           
                                                                           .font(Font.headline.weight(.bold))
                                               
                                           }
                                           .padding()
                            
                            
                                   }
                        }
                
                     
                      HStack {
                          
                          Text("Already have an account?")
                              .frame(width: 168, height: 20, alignment: .center)
                             
                              
                              .foregroundColor(.black)
                              
                              .cornerRadius(35)
                              .font(.system(size: 14))
                          
                          NavigationLink(destination: login()) {
                              Text("Login")
                                  
                                  
                                  .padding(.leading,0)
                                  .foregroundColor(.blue)
                                  
                                  .cornerRadius(35)
                                  .font(.system(size: 14))
                                  .frame(width: 50, height: 100, alignment: .center)
                          }
                         
                          
                          Spacer()
                          
                      } .frame(width: 220, height: 50, alignment: .center)
                      
                     
                  }
                  .frame(maxWidth: .infinity)
                  .padding(.top,60)
                      
                  
                  
          }.navigationBarTitle("")
          .navigationBarHidden(true)
                  .frame(maxWidth: .infinity)
                                   .padding(.top,0)
          }
               
           
        }.navigationBarTitle("")
        .navigationBarHidden(true)
}
    
     func register(){
        print("dfg")
 //        let param : Parameters  = [
 //              "userName":"9133117471",
 //              "password":"Sree@123"
 //
 //                               ]
 //
         let param : Parameters  = [
            
            
            "name":"yashika",
            "mobileNumber":"9966666400",
            "email":"yashika@gmail.com",
            "gender":1,
            "password":"Yashika@94",
            "qualifications":"btech",
            "dateOfBirth":"01-11-1994",
            "bloodGroup":1,
            "dominantSide":1,
            "schoolName":"zphs"
            
            
            
         ]
           
        let headers:HTTPHeaders = [
           "Content-Type": "application/x-www-form-urlencoded",
           "Accept": "application/json",
           "version":"1.0.0",
            "source":"app"
             
               ]
        let url1 = "https://staging.sreenidhi1sports.com/api/AppUsers/registerUser"
          print(param)
     
         AF.request(url1, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON {
                   response in
                 
                   switch response.result {
                   case .success(let value):
                       do {
                         var data = value as? [String:Any]
                         print(data)
                        
                        if  let succss = data?["success"] as? Int {
                                                  
                                                  self.loginT = true
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
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
