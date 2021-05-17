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
        @State  var Genders = [String]()
        @State  var labels = [String]()
        @State  var labels2 = [String]()
        @State  var values = [Int]()
        @State  var values1 = [Int]()
        
        @State  var value1Main = 0
        
        @State  var labels3 = [String]()
        @State  var labels4 = [String]()
        @State  var values2 = [Int]()
        @State  var values22 = [Int]()
        
        @State  var value2Main = 0
        
        @State  var labels5 = [String]()
        @State  var labels6 = [String]()
        @State  var values3 = [Int]()
        @State  var values33 = [Int]()
        
        @State  var value3Main = 0
        
        @State  var genderVal = ""
        @State  var bloodVal = ""
        @State  var dominatVal = ""
        
        
        
        
        
                   @State var login1:Bool = false
                   @State var tokenMain = ""
        @State var name = ""
        @State var selected = "Gender"
        @State var selected2 = "BloodGroup"
        @State var selected3 = "DominantSide"
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
                      .frame(width: 330, height: 60, alignment: .center)
                          .overlay(
                              RoundedRectangle(cornerRadius: 35)
                                  .stroke(Color.gray, lineWidth: 2)
                          )
                          .padding(.top,20)
                        
                          .padding(.top,20)
                      
                    TextField("  Mobile Number", text: $mobileNumber)
                                         .frame(width: 330, height: 60, alignment: .center)
                                             
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 35)
                                                     .stroke(Color.gray, lineWidth: 2)
                                             )
                                             .padding(.top,20)
                        TextField("  email", text: $email)
                                                               .frame(width: 330, height: 60, alignment: .center)
                                                                   
                                                                   .overlay(
                                                                       RoundedRectangle(cornerRadius: 35)
                                                                           .stroke(Color.gray, lineWidth: 2)
                                                                   )
                                                                   .padding(.top,20)
                        
                        
                        VStack{
                                   DisclosureGroup(selected,isExpanded:$expand) {
                                
                                VStack {
                                    ForEach(Array(labels2.enumerated()), id: \.1) { index, element in
                                       
                                        Text("\(element)")
                                            .font(.title3)
                                            .padding(.all)
                                            .onTapGesture {
                                                selected = element
                                                
                                                value1Main = values1[index]
                                                
                                                print(value1Main)
                                                self.expand.toggle()
                                            }
                                    }
                                    
                                    
                                    
                                }
                            }
                                   
                                   .accentColor(.black)
                                   .padding(.all)
    
                                   .font(.system(size:18))
                            .foregroundColor(Color.black)
                            .foregroundColor(.white)
                                  
                            .background(Color.clear)
                            .font(.title2)
                            .cornerRadius(8)
                         
                                  
                                          .overlay(
                                              RoundedRectangle(cornerRadius: 35)
                                                  .stroke(Color.gray, lineWidth: 2)
                                          )
                                   .frame(width:330)
                                   
                            Spacer()
                            
                            
                            
                     }.padding(.top,10)
                   
                    TextField("   Password", text: $password)
                               .frame(width: 330, height: 60, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,10)
                        
                               TextField("    qualifications", text: $qualifications)
                               .frame(width: 330, height: 60, alignment: .center)
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.gray, lineWidth: 2)
                                   )
                                   .padding(.top,20)
                             
                          
                                                  
                 
                        VStack {
                            
                            TextField("   DateofBirth", text: $dateofbirth)
                                                 .frame(width: 330, height: 60, alignment: .center)
                                                     
                                                     .overlay(
                                                         RoundedRectangle(cornerRadius: 35)
                                                             .stroke(Color.gray, lineWidth: 2)
                                                     )
                                                     .padding(.top,20)
                            
                                                   VStack  {
                                                                DisclosureGroup(selected2,isExpanded:$expand1) {
                                                             
                                                             VStack {
                                                                ForEach(Array(labels4.enumerated()), id: \.1) { index, element in
                                                                    
                                                                     Text("\(element)")
                                                                         .font(.title3)
                                                                         .padding(.all)
                                                                         .onTapGesture {
                                                                             value2Main = values22[index]
                                                                             self.expand1.toggle()
                                                                         }
                                                                 }
                                                                 
                                                                 
                                                                 
                                                             }
                                                         }
                                                                
                                                                .accentColor(.black)
                                                                .padding(.all)
                                 
                                                                .font(.system(size:18))
                                                         .foregroundColor(Color.black)
                                                         .foregroundColor(.white)
                                                               
                                                         .background(Color.clear)
                                                         .font(.title2)
                                                         .cornerRadius(8)
                                                      
                                                               
                                                                       .overlay(
                                                                           RoundedRectangle(cornerRadius: 35)
                                                                               .stroke(Color.gray, lineWidth: 2)
                                                                       )
                                                                .frame(width:330)
                                                                
                                                         Spacer()
                                                         
                                                         
                                                         
                                                   }.padding(.top,20)
                            VStack  {
                                     DisclosureGroup(selected3,isExpanded:$expand2) {
                                      VStack {
                                        ForEach(Array(labels6.enumerated()), id: \.1) { index, element in
                                             
                                              Text("\(element)")
                                                  .font(.title3)
                                                  .padding(.all)
                                                  .onTapGesture {
                                                    value3Main = values33[index]
                                                      self.expand2.toggle()
                                                  }
                                          }
                                          
                                      }
                                  }
                                         
                                         .accentColor(.black)
                                         .padding(.all)
          
                                         .font(.system(size:18))
                                  .foregroundColor(Color.black)
                                  .foregroundColor(.white)
                                        
                                  .background(Color.clear)
                                  .font(.title2)
                                  .cornerRadius(8)
                               
                                        
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 35)
                                                        .stroke(Color.gray, lineWidth: 2)
                                                )
                                         .frame(width:330)
                                         
                                  Spacer()
                                  
                                  
                                  
                            }.padding(.top,20)
                            
                       
                            
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
                  .onAppear {
                          print("ContentView appeared!")
                        dropDown()
                      }
                
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
   
    
     labels3 = [String]()
     values2 = [Int]()
     
   let url2 = "https://staging.sreenidhi1sports.com/api/Options"

    AF.request(url2, method: .get, parameters:nil ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
              response in
            
              switch response.result {
              case .success(let value):
                  do {
                  
                    
                     if  let data = value as? [[String:Any]] {
                    
                         for i in data {
                             if let identifier = i["identifier"] as? String {
                         
                                 if identifier == "GENDER" {
                             
                             if let label = i["label"] as? String {
                                 labels.append(label)
                                 }
                                     if let value = i["value"] as? Int {
                                     values.append(value)
                                                                                                       
                                     }
                                     
                                
                                     
                             }
                                 if identifier == "BLOODGROUP" {
                             
                             if let label = i["label"] as? String {
                                 labels3.append(label)
                                 }
                                     if let value = i["value"] as? Int {
                                     values2.append(value)
                                                                                                       
                                     }
                                     
                                
                                     
                             }
                                 if identifier == "DOMINANTSIDE" {
                             
                             if let label = i["label"] as? String {
                                 labels5.append(label)
                                 }
                                     if let value = i["value"] as? Int {
                                     values3.append(value)
                                                                                                       
                                     }
                                     
                                
                                     
                             }
                                 
                               print(values)
                              print(values2)
                                 print(values3)
                                 
                                let rr = labels.removeDuplicates()
                                labels2 = rr
                                 
                                 let v1 = values.removeDuplicates()
                                 values1 = v1
                                 
                                 let v2 = values2.removeDuplicates()
                                 values22 = v2
                                 
                                 let v3 = values3.removeDuplicates()
                                 values33 = v3
                                 
                                 
                                 let rr2 = labels3.removeDuplicates()
                                 labels4 = rr2
                                 
                                 let rr3 = labels5.removeDuplicates()
                                 labels6 = rr3
                                 
                                 
                                 
                             }
                           
                          
                             
                         }
                         
                         
                         
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
extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
