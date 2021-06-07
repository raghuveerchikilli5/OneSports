//
//  SwiftUIView.swift
//  OneSports
//
//  Created by Apple on 03/06/21.
//

import SwiftUI
import Alamofire
import UIKit

struct AddStudent: View {
    
    //  Declaring  Variables
    @State var shouldHide = false
    @State private var isShowPhotoLibrary = false
    @State private var photo = false
    @State private var camera = false
    @State private var image = UIImage()
    @State var showDatePicker: Bool = false
       @State var savedDate: Date? = nil
    @State var mail: String = ""
        @State  var loginT:Bool = false
        @State  var expand:Bool = false
        @State  var expand1:Bool = false
        @State  var expand2:Bool = false
        @State  var Genders = [String]()
        @State  var labels = [String]()
        @State  var centreNames = [String]()
        @State  var batchNames = [String]()
       @State  var batchName = ""
        @State  var labels2 = ["String","d","r"]
    
        @State  var centreIDs = [Int]()
    @State  var centreID = 0
    
        @State  var values = [Int]()
        @State  var values1 = [Int]()
    @State  var  dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
   
    
    @State private var birthDate = Date()
        @State  var centre = 0
        
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
            
            ZStack {
            ScrollView(.vertical) {
                    
                   
               
            
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
                                                    maxHeight: 50,
                                                    alignment: .leading
                                                  )
                                                .onTapGesture {
                                                    back = true
                                                }
                            
                                               }
                        
                                               .background(Color.red)
                        
                        
                        VStack{
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .background(Color.red)
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(10)
                                .padding(.top,40)
                    Button(action: {
                                      
                        shouldHide = false
                        
                        
                                   }) {
                                     
                                           
                        HStack{
                            Spacer()
                                        Text("+")
                                        .font(.headline)
                                       .frame(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30)
                                       .background(Color.blue)
                                       .foregroundColor(.white)
                                       .cornerRadius(20)
                                            .padding(.top,-20)
                        
                        }.frame(width: 100)
                        
                        
                        
                                   }
                        Spacer()
                        }
                        
                        
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
                                    ZStack {
                                VStack {
                                    ForEach(Array(centreNames.enumerated()), id: \.1) { index, element in
                                       
                                        Text("\(element)")
                                            .font(.title3)
                                            .padding(.all)
                                            .onTapGesture {
                                                selected = element
                                                print("ok",centreIDs[index])
                                                batchDropDown(id: centreIDs[index])
                                                
                                                
                                                self.expand.toggle()
                                            }
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
                                                         ForEach(Array(batchNames.enumerated()), id: \.1) { index, element in
                                                            
                                                             Text("\(element)")
                                                                 .font(.title3)
                                                                 .padding(.all)
                                                                 .onTapGesture {
                                                                    selectBatch = element
                                                                 
                                                                   
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
                            
                            VStack{
                                       DisclosureGroup(selectGender,isExpanded:$expand2) {
                                    
                                    VStack {
                                        ForEach(Array(labels2.enumerated()), id: \.1) { index, element in
                                           
                                            Text("\(element)")
                                                .font(.title3)
                                                .padding(.all)
                                                .onTapGesture {
                                                   selectGender = element
                                                    
                                                   value2Main = values[index]
                                                    
                                                    print(value2Main)
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
                            
                            
                        
                                           HStack {
                                                   Text("Mobile Numer *")
                                                   .padding(.leading,20)
                                                   Spacer()
                                           }
                                           HStack {
                                               TextField("    Enter mobile number", text: $mobileNumber)
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
                                                                     TextField("    Enter Email ID", text: $email)
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
                                ZStack{
                                    Text("\(savedDate ?? Date(), formatter: dateFormatter)")
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
                  .sheet(isPresented: $isShowPhotoLibrary) {
                    if camera == true {
                        ImagePicker(selectedImage: self.$image, sourceType: .camera)
                    }
                    else if photo == true {
                        ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
                        
                    }
                    
                      
                    }
                   
                   
                  
          }.navigationBarTitle("")
          .navigationBarHidden(true)
                  .frame(maxWidth: .infinity)
                                   .padding(.top,0)
                  .onAppear {
                    shouldHide = true
                          print("ContentView appeared!")
                       DropDown()
                    centreDropDown()
                      }
                VStack(spacing:10){
                                       Spacer()
                    
                    if !self.$shouldHide.wrappedValue {
                                   Button(action: {
                                    shouldHide = true
                                           photo = true
                                         camera = false
                                                   self.isShowPhotoLibrary = true
                                               }) {
                                                   HStack {
                                                       Image(systemName: "photo")
                                                           .font(.system(size: 20))
                                    
                                                       Text("Photo library")
                                                           .font(.headline)
                                                   }
                                                   .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                                                   .background(Color.blue)
                                                   .foregroundColor(.white)
                                                   .cornerRadius(20)
                                                   .padding(.horizontal)
                                               }
                                   Button(action: {
                                    shouldHide = true
                                    camera = true
                                  photo = false
                                                                      self.isShowPhotoLibrary = true
                                                                  }) {
                                                                      HStack {
                                                                          Image(systemName: "camera")
                                                                              .font(.system(size: 20))
                                                       
                                                                          Text("Camera")
                                                                              .font(.headline)
                                                                      }
                                                                      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                                                                      .background(Color.blue)
                                                                      .foregroundColor(.white)
                                                                      .cornerRadius(20)
                                                                      .padding(.horizontal)
                                                                  }
                        
                    }
                        
                                   
                                   }.padding(.bottom,0)
                
                
                
          }
               
           
        }.navigationBarTitle("")
        .navigationBarHidden(true)
}
    
    // Regisiter API
    
    
    func addStudent(){
             
              let param : Parameters  = [
                "name":name,
                "gender":value2Main,
                "mobileNumber":mobileNumber,
                "email":email,
                "batchId":1,
                "dateOfBirth":"\(savedDate ?? Date())"
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
    
    func DropDown(){
        let headers:HTTPHeaders = [
    "Content-Type": "application/x-www-form-urlencoded",
    "Accept": "application/json",
    "version":"1.0.0",
     "source":"app"
     ]
   
    
        labels = [String]()
        values = [Int]()
     
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
                         
                        
                                 
                               print(values)
                           
                                 
                                let rr = labels.removeDuplicates()
                                labels2 = rr
                                 
                                 let v1 = values.removeDuplicates()
                                 values1 = v1
                                 
                               
                                 
                                 
                                 
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
    func centreDropDown(){
        
        let param:Parameters = [
            "where":["isActive":1]
        ]
        let headers:HTTPHeaders = [
    "Content-Type": "application/x-www-form-urlencoded",
    "Accept": "application/json",
    "version":"1.0.0",
     "source":"app"
     ]
      
        centreNames = [String]()
        centreIDs = [Int]()
   let url2 = "https://staging.sreenidhi1sports.com/api/Infrastructures?filter="

    AF.request(url2, method: .get, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
              response in
            
              switch response.result {
              case .success(let value):
                  do {
                  
                    
                     if  let data = value as? [[String:Any]] {
                    
                     
                        for i in data {
                            
                          if  let isActive = i["isActive"] as? Int {
                            if isActive == 1 {
                                
                                if let name = i["name"] as? String {
                                centreNames.append(name)
                                }
                                if let id = i["id"] as? Int {
                                    centreIDs.append(id)
                                }
                                print(i)
                            }
                            
                            
                                
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
    func batchDropDown(id:Int){
        batchNames = [String]()
        let param:Parameters = [
            "where":["isActive":1]
        ]
        let headers:HTTPHeaders = [
    "Content-Type": "application/x-www-form-urlencoded",
    "Accept": "application/json",
    "version":"1.0.0",
     "source":"app"
     ]
        
       
        
   let url2 = "https://staging.sreenidhi1sports.com/api/Infrastructures/\(id)/batches"

    AF.request(url2, method: .get, parameters:param ,encoding: URLEncoding(), headers: headers).validate().responseJSON { [self]
              response in
            
              switch response.result {
              case .success(let value):
                  do {
                  
                    
                     if  let data = value as? [[String:Any]] {
                    
                     
                        for i in data {
                            
                            if  let batchNames1 = i["name"] as? String{
                            batchNames.append(batchNames1)
                            
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


struct ImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
 
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = context.coordinator

        imagePicker.sourceType = sourceType
 
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
 
    }
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    
}



