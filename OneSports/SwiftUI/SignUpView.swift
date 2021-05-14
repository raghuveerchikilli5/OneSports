//
//  SignUpView.swift
//  OneSports
//
//  Created by apple on 12/05/21.
//

import SwiftUI
import Alamofire

struct SignUpView: View {
    
    //  Declaring  Variables
    
    @State var mail: String = ""
    @State  var loginT:Bool = false
    @State  var expand:Bool = false
    @State  var expand1:Bool = false
    @State  var expand2:Bool = false
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
                        .font(.system(size:35))
                        
                        .font(Font.headline.weight(.bold))
                          
                  
                    
                      Text("Add your details to SignUp")
                          .foregroundColor(Color.black)
                          .multilineTextAlignment(.center)
                          .padding(.bottom, 10)
                          .font(.system(size: 12))
                      
                      TextField("   Name", text: $name)
                      .frame(width: 330, height: 55, alignment: .center)
                          .overlay(
                              RoundedRectangle(cornerRadius: 35)
                                  .stroke(Color.gray, lineWidth: 2)
                          )
                          .padding(.top,20)
                        
                          .padding(.top,20)
                      
                    TextField("  Mobile Number", text: $mobileNumber)
                                         .frame(width: 330, height: 55, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                        TextField("  email", text: $email)
                                                               .frame(width: 330, height: 55, alignment: .center)
                                                                   
                                                                   .overlay(
                                                                       RoundedRectangle(cornerRadius: 35)
                                                                           .stroke(Color.gray, lineWidth: 2)
                                                                   )
                                                                   .padding(.top,20)
                        
                        
                                         
                    TextField("   Gender", text: $gender)
                                         .frame(width: 330, height: 55, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                   
                        VStack{
                        Button(action: {
                                  dropDown()
                            print("SwiftUI: Button tapped")
                            self.expand.toggle()
                                            
                                             
                                       })
                                       {
                                               Text("Sign Up")
                                               .frame(width: 330, height: 30, alignment: .center)
                                               .padding()
                                               .foregroundColor(.clear)
                                               .background(Color.clear)
                                               .cornerRadius(35)
                                                .font(.system(size:35))
                                                                       
                                              .font(Font.headline.weight(.bold))
                                           
                                       }
                                        .padding(.top,-73)
                        
                        if expand {
                            VStack{
                            Text("Male").onTapGesture{
                                self.expand.toggle()
                                gender = "Male"
                                
                            }
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top, -10)
                              .font(.system(size:25))
                                .frame(width: 330, height: 10, alignment: .topLeading)
                              .font(Font.headline.weight(.bold))
                                .padding(.bottom,5)
                            .padding(.leading,10)
                            Text("Female").onTapGesture{
                                self.expand.toggle()
                                gender = "Female"
                            }
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 0)
                              .font(.system(size:25))
                                .frame(width: 330, height: 10, alignment: .topLeading)
                              .font(Font.headline.weight(.bold))
                            }.padding(.top,0)
                            .padding(.bottom,10)
                            .padding(.leading,12)
                        }
                        
                        
                        }.padding(.bottom,0)
                    TextField("   Password", text: $password)
                               .frame(width: 330, height: 55, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,10)
                        
                               TextField("    qualifications", text: $qualifications)
                               .frame(width: 330, height: 55, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,20)
                             
                          
                                                  
                 
                        VStack {
                            
                            TextField("   dateofbirth", text: $dateofbirth)
                                                 .frame(width: 330, height: 55, alignment: .center)
                                                     
                                                     .overlay(
                                                         RoundedRectangle(cornerRadius: 35)
                                                             .stroke(Color.gray, lineWidth: 2)
                                                     )
                                                     .padding(.top,20)
                            
                            
                            
                                           TextField("   bloodgroup", text: $bloodgroup)
                                                                                                             .frame(width: 330, height: 55, alignment: .center)
                                                                                                                 
                                                                                                                 .overlay(
                                                                                                                     RoundedRectangle(cornerRadius: 35)
                                                                                                                         .stroke(Color.gray, lineWidth: 2)
                                                                                                                 )
                                                                                                                 .padding(.top,20)
                            
                            VStack{
                            Button(action: {
                                            print("SwiftUI: Button tapped")
                                self.expand1.toggle()
                                                
                                                 
                                           })
                                           {
                                                   Text("Sign Up")
                                                   .frame(width: 330, height: 30, alignment: .center)
                                                   .padding()
                                                   .foregroundColor(.clear)
                                                   .background(Color.clear)
                                                   .cornerRadius(35)
                                                    .font(.system(size:35))
                                                                           
                                                  .font(Font.headline.weight(.bold))
                                               
                                           }
                                            .padding(.top,-73)
                            
                            if expand1 {
                                VStack{
                                Text("Male").onTapGesture{
                                    self.expand1.toggle()
                                    gender = "Male"
                                    
                                }
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, -10)
                                  .font(.system(size:20))
                                    .frame(width: 330, height: 10, alignment: .topLeading)
                                  .font(Font.headline.weight(.bold))
                                    .padding(.bottom,5)
                                .padding(.leading,10)
                                Text("Female").onTapGesture{
                                    self.expand1.toggle()
                                    gender = "Female"
                                }
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 0)
                                  .font(.system(size:20))
                                    .frame(width: 330, height: 10, alignment: .topLeading)
                                  .font(Font.headline.weight(.bold))
                                }.padding(.top,0)
                                .padding(.bottom,10)
                                .padding(.leading,12)
                            }
                            
                            
                            }.padding(.bottom,0)
                            
                            
                            TextField("   dominantside", text: $dominantside)
                                                                                              .frame(width: 330, height: 55, alignment: .center)
                                                                                                  
                                                                                                  .overlay(
                                                                                                      RoundedRectangle(cornerRadius: 35)
                                                                                                          .stroke(Color.gray, lineWidth: 2)
                                                                                                  )
                                                                                                  .padding(.top,20)
                            
                            VStack{
                            Button(action: {
                                            print("SwiftUI: Button tapped")
                                self.expand2.toggle()
                                                
                                                 
                                           })
                                           {
                                                   Text("Sign Up")
                                                   .frame(width: 330, height: 30, alignment: .center)
                                                   .padding()
                                                   .foregroundColor(.clear)
                                                   .background(Color.clear)
                                                   .cornerRadius(35)
                                                    .font(.system(size:35))
                                                                           
                                                  .font(Font.headline.weight(.bold))
                                               
                                           }
                                            .padding(.top,-73)
                            
                            if expand2 {
                                VStack{
                                Text("Male").onTapGesture{
                                    self.expand2.toggle()
                                    gender = "Male"
                                    
                                }
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, -10)
                                  .font(.system(size:25))
                                    .frame(width: 330, height: 10, alignment: .topLeading)
                                  .font(Font.headline.weight(.bold))
                                    .padding(.bottom,5)
                                .padding(.leading,10)
                                Text("Female").onTapGesture{
                                    self.expand2.toggle()
                                    gender = "Female"
                                }
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 0)
                                  .font(.system(size:25))
                                    .frame(width: 330, height: 10, alignment: .topLeading)
                                  .font(Font.headline.weight(.bold))
                                }.padding(.top,0)
                                .padding(.bottom,10)
                                .padding(.leading,12)
                               
                            }
                            
                            
                            }.padding(.bottom,0)
                            
                            TextField("    schoolName", text: $schoolName)
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
                                                    .font(.system(size:35))
                                                                           
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
    
    // Regisiter API
    
     func register(){
        print("dfg")
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
                        if  let succss = data?["success"] as? Int {
                            
                            loginT = true
                        }
                        
                        
                        
                        
                        

                       
                       }
                       break
                   case .failure(let error):
                          
                       print("failed response ",error)
       //                print("sendLatLong Err", error.localizedDescription)
                                     
                   }
               }
     }
  
    func dropDown(){
           let headers:HTTPHeaders = [
       "Content-Type": "application/x-www-form-urlencoded",
       "Accept": "application/json",
       "version":"1.0.0",
        "source":"app"
        ]
      
        
        
      let url2 = "https://staging.sreenidhi1sports.com/api/Options"

       AF.request(url2, method: .get, parameters:nil ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
                 response in
               
                 switch response.result {
                 case .success(let value):
                     do {
                       DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                           login1 = true
                                             
                                         }
                                         
                       
                        var data = value as? [[String:Any]]
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
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
