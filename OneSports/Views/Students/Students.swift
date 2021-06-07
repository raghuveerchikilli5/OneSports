//
//  Students.swift
//  OneSports
//
//  Created by apple on 01/06/21.
//

import SwiftUI
import Alamofire

struct Students: View {
    @State var menuOpen: Bool = false
    @State var more: Bool = false
    @State var menuIndex = MenuContent()
    @State var index:Int = 0
    @State var searchText:String = ""
    @State var login1:Bool = false
    @State var addStu:Bool = false
    @State var names = [String]()
    
    @State private var  animals = [ToDoItem]()
                                    
                                   
    
    
    var body: some View {
        NavigationView {
                  ZStack {
                  ScrollView(.vertical) {
        VStack {
            
            NavigationLink(destination: Dashboard() ,isActive: $menuIndex.dash) {
               
                                            }
            NavigationLink(destination: AddStudent() ,isActive: $addStu) {
                          
                                                       }
            
            NavigationLink(destination: More() ,isActive: $more) {
           }
            
            VStack{
                
            HStack{
                                    if !self.menuOpen {
                                    Button(action: {
                                        print(menuIndex.dash)
                                        self.openMenu()
                                        index = 1
                                                    print("apple sign in")
                                        }) {
                                                                   
                                                                   
                                            Image("iconfinder_menu_3324998")
                                            .resizable()
                                                .padding(.leading,10)
                                            .frame(width: 50, height: 50, alignment: .leading)
                                                               }
                                    
                                    }
                                    
                                    Spacer()
                                    Text("Students")
                                        .padding(.leading,-30)
                                        .font(.system(size:20))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("")
                                        
                                        
                                    
                                    
                                }.frame( height: 70, alignment: .leading)
                                .background(Color.red)
                                Spacer()
            }
            .onAppear {
                studentData()
                                                      
                                                    
                        }
            VStack {
                SearchBar(text: $searchText)
                                               .padding(.top, 0)
                    .padding(.top,10)
                    .padding(.bottom,10)
                
                    
                
                HStack {
                    Spacer()
                    Button(action: {
                                                                                                   print("SwiftUI: Button tapped")
                                                                                                                                           // Call func in SomeView()
                                                                                                       
                                                                                                                                         
                                                                                                   })
                                                                                   {
                                                                                   Text("EXPORT")
                                                                           
                                                                                   .frame(width: 150, height: 10, alignment: .center)
                                                                                   .padding()
                                                                                   .foregroundColor(.black)
                                                                               .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray, lineWidth: 2)
                                                                                    )
                                                                               .font(.system(size:20))
                                                                                                                                                                   
                                                                           .font(Font.headline.weight(.bold))
                                                                                                                                       
                                                                               }
                    
                    Button(action: {
                                                                                                   print("SwiftUI: Button tapped")
                                                                                                                                           // Call func in SomeView()
                                                                                                       
                                                                                                                                         
                                                                                                   })
                                                                                   {
                        Text("IMPORT")
                                                                                   .frame(width: 150, height: 10, alignment: .center)
                                                                                   .padding()
                                                                                   .foregroundColor(.black)
                                                                               .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray, lineWidth: 2)
                                                                                                              )
                                                                               .font(.system(size:18))
                                                                                                                                                                   
                                                                           .font(Font.headline.weight(.bold))
                                                                                                                                       
                                                                               }
                    
                Spacer()
                }
                
                
                List {
                               ForEach(animals.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }), id: \.self) { animal in
                                VStack {
                                HStack{
                                    
                                Image("apple")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    
                                    VStack() {
                                    Text(animal.name)
                                    .fontWeight(.bold)
                                    .padding(.leading,-88)
                                    .frame(alignment: .leading)
                                        
                                    Text("Female(Age:27)")
                                    .padding(.leading,-58)
                                    Text("phone : 95944334354")
                                    
                                    Text("email :shilpa@gmail.com")
                                        .padding(.leading,3)
                                    }
                                    .frame(width:270)
                                    .padding(.leading,-50)
                                    Spacer()
                                    VStack {
                                        Button(action: {
                                                print("SwiftUI: Button tapped")
                                                                                // Call func in SomeView()
                                                    
                                                                                      
                                                })
                                {
                                Image("apple")
                                    .resizable()
                                    .scaledToFill()
                                .frame(width: 15, height: 15, alignment: .center)
                                .padding()
                                .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(35)
                            .font(.system(size:20))
                                    
                        .font(Font.headline.weight(.bold))
                                                                                    
                            }
                                                    
                                        Button(action: {
                                                                                print("SwiftUI: Button tapped")
                                                                                                                        // Call func in SomeView()
                                                                                    
                                                                                                                      
                                                                                })
                                                                {
                                                                Image("apple")
                                                                    .resizable()
                                                                                                        .scaledToFill()
                                                                .frame(width: 15, height: 15, alignment: .center)
                                                                .padding()
                                                                .foregroundColor(.white)
                                                            .background(Color.red)
                                                            .cornerRadius(35)
                                                            .font(.system(size:20))
                                                                                                                                                
                                                        .font(Font.headline.weight(.bold))
                                                                                                                    
                                                            }
                                    }
                                  Spacer(minLength: 10)
                                    
                                    
                                    
                                }
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Image("apple")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 25, height: 10, alignment: .center)
                                            Text("attendance")
                                            .font(.system(size:14))
                                            
                                        }
                                        Spacer()
                                        VStack {
                                            Image("apple")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 25, height: 10, alignment: .center)
                                            Text("Payments")
                                            .font(.system(size:14))
                                            
                                        }
                                        Spacer()
                                        VStack {
                                            Image("apple")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 25, height: 10, alignment: .center)
                                            Text("De-register")
                                            .font(.system(size:14))
                                            
                                        }
                                        Spacer()
                                        VStack {
                                            Image("apple")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 25, height: 10, alignment: .center)
                                                .onTapGesture {
                                                    more = true
                                                }
                                            Text("More")
                                            .font(.system(size:14))
                                            
                                        }
                                        Spacer()
                                    }
                                }
                               }
                               
                               // 3.
                               .onDelete(perform: self.deleteRow)
                               .onTapGesture {
                                print("zin")
                                login1 = true
                               }
                           }
                          
                
                
                
            }.frame(height:700)
            
            
            Spacer()
            
            
        }
                  }.navigationBarTitle("")
                  .navigationBarHidden(true)
                    SideMenu(width: 270,
                                                     isOpen: self.menuOpen,
                                                     menuClose: self.openMenu)
                    VStack {
                    Spacer()
                        
                        HStack {
                            Spacer()
                                       Button(action: {
                                               print("SwiftUI: Button tapped")
                                        addStu   = true                                                                                                                   // Call func in SomeView()})
                                                        
                                       })
                                               {
                                                       Text("+")
                                                                                              
                                                   .frame(width: 80, height: 80, alignment: .center)
                                                        
                                                   .foregroundColor(.black)
                                                   .background(Color.red)
                                                        .cornerRadius(40)
                                           .font(.system(size:50))
                                                        .shadow(radius: 15 )
                                                                                                                                                   .font(Font.headline.weight(.bold))
                                                        .padding(.trailing,20)
                                                                                                  }
                                       
                        }
                    }
                    
                    
                        }
                    
        }.navigationBarTitle("")
        .navigationBarHidden(true)
      
        
        
    }
    func studentData(){
        names = [String]()
        animals = [ToDoItem]()
                                        
                                       
         let param : Parameters  =
            ["where":["type":1,"isActive":true],"include":[ ["owner":"appRoles"],"accountDetail","profilePicture"]]
         
           
        let headers:HTTPHeaders = [
            "version":"1.0.0",
             "source":"app"
               ]
        let url1 = "https://staging.sreenidhi1sports.com/api/Accounts?filter="
         
     
         AF.request(url1, method: .get, parameters:param ,encoding: URLEncoding(), headers: headers).responseJSON {
                   response in
                  
                   switch response.result {
                   case .success(let value):
                       do {
                        if  let data = value as? [[String:Any]] {
                           print("huhuu",data)
                        for i in data {
                            if  let name1 = i["name"] as? String {
                           
                            print(name1)
                            animals.append(ToDoItem(name:name1))
                        }
                        
                           
                        }
                           
                        }

                       }
                       break
                   case .failure(let error):
                          
                    print("failed response ",error.localizedDescription)
       //                print("sendLatLong Err", error.localizedDescription)
                                     
                   }
               }
     }
    
    
    
    
    
    
    private func deleteRow(at indexSet: IndexSet) {
        self.animals.remove(atOffsets: indexSet)
    }
    
    func openMenu() {
           self.menuOpen.toggle()
       }
    
}

struct Students_Previews: PreviewProvider {
    static var previews: some View {
        Students()
    }
}
