//
//  SwiftUIView.swift
//  OneSports
//
//  Created by Apple on 03/06/21.
//

import SwiftUI
import Alamofire
struct AddStudent: View {
    
    //  Declaring  Variables
    @State var showDatePicker: Bool = false
       @State var savedDate: Date? = nil
    @State var mail: String = ""
        @State  var loginT:Bool = false
        @State  var expand:Bool = false
        @State  var expand1:Bool = false
        @State  var expand2:Bool = false
        @State  var Genders = [String]()
        @State  var labels = [String]()
        @State  var labels2 = ["String","d","r"]
        @State  var values = [Int]()
        @State  var values1 = [Int]()
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    
    @State private var birthDate = Date()
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
    @State var back:Bool = false
        @State var login1:Bool = false
        @State var tokenMain = ""
        @State var name = ""
        @State var selected = "Select Center"
    @State var selectGender = "Select Gender"
    @State var selectBatch = "Select Batch"
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
                    NavigationLink(destination: Students() ,isActive: $back) {
                                                                                                              }
                       
                       
                   
                    VStack(spacing: 0) {
                       
                        
                        
                        HStack{
                                               Text(" <")
                                               .font(Font.system(size: 50))
                                                   .foregroundColor(.blue)
                                                .frame(
                                                    minWidth: 0,
                                                    maxWidth: .infinity,
                                                    minHeight: 0,
                                                    maxHeight: .infinity,
                                                    alignment: .topLeading
                                                  )
                                                .onTapGesture {
                                                    back = true
                                                }
                            
                                               }
                        
                                               .background(Color.red)
                        
                        
                        
                            Image("apple")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: .center)
                                .padding(.top,40)
                                .padding(.bottom,40)
                        
                        HStack {
                                Text("First Name *")
                                .padding(.leading,20)
                                Spacer()
                        }
                        HStack {
                            TextField("    First Name", text: $name)
                               
                                .background(Color.gray.opacity(0.1))
                            .frame(width: 330, height: 60, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color.gray, lineWidth: 1)
                                )

                            
                            
                                               }
                        .padding(.top,10)
                        
                      

                        
                        
                        VStack{
                            HStack {
                                                                                 Text("Center *")
                                                                                 .padding(.leading,20)
                                                                                 Spacer()
                                                                         }
                            
                            
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
                            
                            
                            
                     }.padding(.top,5)
                        HStack {
                                                                            Text("Batch *")
                                                                            .padding(.leading,20)
                                                                            Spacer()
                                                                    }

                                             
                                             
                                             VStack{
                                                        DisclosureGroup(selectBatch,isExpanded:$expand1) {
                                                     
                                                     VStack {
                                                         ForEach(Array(labels2.enumerated()), id: \.1) { index, element in
                                                            
                                                             Text("\(element)")
                                                                 .font(.title3)
                                                                 .padding(.all)
                                                                 .onTapGesture {
                                                                     selected = element
                                                                     
                                                                     value1Main = values1[index]
                                                                     
                                                                     print(value1Main)
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
                                                 
                                                 
                                                 
                                          }.padding(.top,5)
                                             
                        HStack {
                                                                            Text("Gender *")
                                                                            .padding(.leading,20)
                                                                            Spacer()
                                                                    }

                                             
                                             
                                             VStack{
                                                        DisclosureGroup(selectGender,isExpanded:$expand2) {
                                                     
                                                     VStack {
                                                         ForEach(Array(labels2.enumerated()), id: \.1) { index, element in
                                                            
                                                             Text("\(element)")
                                                                 .font(.title3)
                                                                 .padding(.all)
                                                                 .onTapGesture {
                                                                     selected = element
                                                                     
                                                                     value1Main = values1[index]
                                                                     
                                                                     print(value1Main)
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
                                                                       .stroke(Color.gray, lineWidth: 1)
                                                               )
                                                        .frame(width:330)
                                                        
                                                 Spacer()
                                                 
                                                 
                                                 
                                          }.padding(.top,5)
                        VStack{
                        
                                           HStack {
                                                   Text("Mobile Numer *")
                                                   .padding(.leading,20)
                                                   Spacer()
                                           }
                                           HStack {
                                               TextField("    Enter mobile number", text: $name)
                                                   .background(Color.gray.opacity(0.1))
                                               .frame(width: 330, height: 60, alignment: .center)
                                                   .overlay(
                                                       RoundedRectangle(cornerRadius: 35)
                                                           .stroke(Color.gray, lineWidth: 1)
                                                   )

                                               
                                               
                                                                  }
                            HStack {
                                                                         Text("Email ID *")
                                                                         .padding(.leading,20)
                                                                         Spacer()
                                                                 }
                                                    HStack {
                                                                     TextField("    Enter Email ID", text: $name)
                                                                         .background(Color.gray.opacity(0.1))
                                                                     .frame(width: 330, height: 60, alignment: .center)
                                                                         .overlay(
                                                                             RoundedRectangle(cornerRadius: 35)
                                                                                 .stroke(Color.gray, lineWidth: 1)
                                                                         )

                                                                     
                                                    }
                                                        HStack {
                                                                                                                            Text("Date of Birth *")
                                                                                                                            .padding(.leading,20)
                                                        
                                                            
                                                            
                                                            
                                                            Spacer()
                                                                                                                    }
                            if showDatePicker {
                                           DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                                               .animation(.linear)
                                               .transition(.opacity)
                                       }
                            HStack {
                                ZStack{                                                         Text("   \(savedDate ?? Date(), formatter: dateFormatter)")
                                                                                                                            .background(Color.gray.opacity(0.1))
                                                                                                                        .frame(width: 330, height: 60, alignment: .leading)
                                                                                                                            .overlay(
                                                                                                                                RoundedRectangle(cornerRadius: 35)
                                                                                                                                    .stroke(Color.gray, lineWidth: 1)
                                                                                                                            )
Button(action: {
                                                                                                                showDatePicker.toggle()
                                                                                                                                   print("SwiftUI: Button tapped")
                                                                                                                                   // Call func in SomeView()

                                                                                                                           })
                                                                                                                           {
                                                                                                                Spacer();                                           Image("icon-calendar")                .resizable()
                                                                                                                    .scaledToFill()
                                                                                                                    
                                                                                                                                   .foregroundColor(.white)
                                                                                                                                   .background(Color.red)
                                                                                                                                   .cornerRadius(35)
                                                                                                                    .frame(width: 35, height: 35, alignment: .center)
                                                                                                                    .padding(.trailing,50)
                                                                                                                                                           
                                                                                                                                                           
                                                                                                                               
                                                                                                                           }
                                                                                                                        
                                                                                                        }
                                                                                                                                           }
                            
                            Button(action: {
                                print("SwiftUI: Button tapped")
                                
                                addStudent()
                                                                               // Call func in SomeView()
                                                                              
                                                                             
                                                                       })
                                                                       {
                                                                               Text("Submit")
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
                    
                  .frame(maxWidth: .infinity)
                  .padding(.top,10)
                    
                      
                  
                  
          }.navigationBarTitle("")
          .navigationBarHidden(true)
                  .frame(maxWidth: .infinity)
                                   .padding(.top,0)
                  .onAppear {
                          print("ContentView appeared!")
                       
                      }
                
          }
               
           
        }.navigationBarTitle("")
        .navigationBarHidden(true)
}
    
    // Regisiter API
    
    
    func addStudent(){
             
              let param : Parameters  = [
                "name":"Raghuveer",
                "gender":1,
                "mobileNumber":"8500055580",
                "email":"raghu85000@gmail.com",
                "batchId":1,
                "dateOfBirth":"5-20-1995"
              ]
                
             let headers:HTTPHeaders = [
               
                "version":"1.0.0",
                 "source":"app"
                  
                    ]
             let url1 = "https://staging.sreenidhi1sports.com/api/AppUsers/addStudent?"
              
          
              AF.request(url1, method: .post, parameters:param ,encoding: URLEncoding(), headers: headers).responseJSON {
                        response in
                      
                        switch response.result {
                        case .success(let value):
                            do {
                                
                                var data = value as! [String:Any]
                   print(data)
                              
                              
                                
                            }
                            break
                        case .failure(let error):
                               
                         print("failed response ",error.localizedDescription)
            //                print("sendLatLong Err", error.localizedDescription)
                                          
                        }
                    }
          }
    
  

    
}

struct AddStudent_Previews: PreviewProvider {
    static var previews: some View {
        AddStudent()
    }
}
struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
   

    var body: some View {
        ZStack {
            
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Divider()
                HStack {
                    
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        savedDate = selectedDate
                        showDatePicker = false
                    }, label: {
                        Text("OK".uppercased())
                            .bold()
                    })
                    
                }
                .padding(.horizontal)

            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(30)
            )

            
        }

    }
    
    
    
    
}




