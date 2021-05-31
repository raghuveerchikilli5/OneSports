//
//  Dashboard.swift
//  OneSports
//
//  Created by apple on 11/05/21.
//

import SwiftUI
import Alamofire

struct Dashboard: View {
    @State var needRefresh: Bool = false
    @State var dashboardCount: Int?
    @State var keys1 = [String]()
    @State var values1 = [Int]()
    @State var images = [UIImage(named: "Student"),UIImage(named: "Centre"),UIImage(named: "Courses"),UIImage(named: "Staff")]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
           
        ]
    @State var menuOpen: Bool = false
    var body: some View {
        
        
        NavigationView {
            
        
            ZStack {
                  
                   
                  
           
           
         
            
            ScrollView(.vertical) {
           
                VStack {
                    HStack{
                        if !self.menuOpen {
                        Button(action: {
                                                   
                            self.openMenu()
                                                       
                                        print("apple sign in")
                            }) {
                                                       
                                                       
                                Image("icons8-menu-24")
                                .resizable()
                                    .padding(.leading,10)
                                .frame(width: 40, height: 30, alignment: .leading)
                                                   }
                        
                        }
                        
                        Spacer()
                        Text("Academy Profile")
                            .padding(.leading,-30)
                            .font(.system(size:20))
                            .foregroundColor(.white)
                        Spacer()
                        Text("")
                            
                            
                        
                        
                    }.frame( height: 70, alignment: .leading)
                    .background(Color.red)
                    Spacer()
                    HStack {
                        Button(action: {
                                                                        
                                                                            
                                                                            
                                                             print("apple sign in")
                                                 }) {
                                                                            
                                                                            
                                                    
                                                                        }
                                             Spacer()
                                             
                        Image("logo_1")
                            .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 200, height: 150, alignment: .center)
                                    .scaledToFit()
                                                            
                                  
                                             Spacer()
                                             Text("")
                       
                            
                        
                            
                    }.frame( height: 180, alignment: .leading)
                    .background(Color.red.opacity(0.9))
                    .padding(.top,-10)
                    .onAppear {
                    9
                        
                        dashboardData()
                       
                        print("dddd",dashboardCount)
                                    print("ContentView appeared!")
                                }
                    
                    Spacer()
                    
                    VStack {
                        if needRefresh == true {
                        LazyVGrid(columns: columns) {
                            ForEach(0...images.count-1, id: \.self) { index1 in
                                
                                VStack {
                                       
                               
                                    Image(uiImage: images[index1]!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width / 2.5, height: 200)
                                    
                                    Text("\(values1[index1])  \(keys1[index1])")
                                        .frame(width: 120, height: 30, alignment: .center)
                                            .padding(.bottom, 20)
                                        .font(Font.headline.weight(.heavy))
                                           .font(.system(size:10))
                                      
                                }
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                                        
                                      }
                                  }
                        
                        }
                            
                    }.padding(.top,0)
                    
                    
                  Spacer()
                    
                    
                    
            
            }
               
                
                
                
        }
        .navigationBarTitle("")
                .navigationBarHidden(true)
                
                SideMenu(width: 270,
                         isOpen: self.menuOpen,
                         menuClose: self.openMenu)
                
    
}
        .navigationBarTitle("")
                        .navigationBarHidden(true)
        } .navigationBarTitle("")
        .navigationBarHidden(true)
}
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
     func dashboardData(){
          keys1 = [String]()
          values1 = [Int]()
          let param : Parameters  = [
            "studentCount":24,"coachCount":5,"infrastructureCount":9,"roleCount":19,"courseCount":9,"batchCount":23,"staffCount":9
          ]
            
         let headers:HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json",
            "version":"1.0.0",
             "source":"app"
              
                ]
         let url1 = "https://staging.sreenidhi1sports.com/api/AppUsers/fetchDashboardCount"
          
      
          AF.request(url1, method: .get, parameters:param ,encoding: URLEncoding(), headers: headers).responseJSON {
                    response in
                  
                    switch response.result {
                    case .success(let value):
                        do {
                            var data = value as! [String:Any]
                            print("fsrs",data.keys) as? String
                            
                            if let student = data["studentCount"] as? Int {
                                
                                keys1.append("STUDENTS")
                                values1.append(student)
                            }
                            if let infrastructureCount = data["infrastructureCount"] as? Int {
                                
                                keys1.append("CENTERS")
                                values1.append(infrastructureCount)
                            }
                            if let courseCount = data["courseCount"] as? Int {
                                keys1.append("COURSES")
                                values1.append(courseCount)
                            }
                            if let staffCount = data["staffCount"] as? Int {
                                keys1.append("STAFF")
                                values1.append(staffCount)
                            }
                            
                           
                            print(data.values)
                            dashboardCount = data.count
                            
                          
                            if  let count = data["studentCount"] as? Int {
                           
                            print("dashboard count",dashboardCount)
                            needRefresh = true
                         }
                            
                        }
                        break
                    case .failure(let error):
                           
                     print("failed response ",error.localizedDescription)
        //                print("sendLatLong Err", error.localizedDescription)
                                      
                    }
                }
      }
    
}
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
struct User {
    let image1:String
    static func allUsers() -> [User] {
        
        
        return [
            User(image1:"apple"),
            User(image1:"apple"),
            User(image1:"apple"),
            User(image1:"apple"),
            User(image1:"apple"),
            User(image1:"apple"),
            User(image1:"apple")
        ]
    }
}
struct MenuContent: View {
    @State private var fruits = ["DASHBOARD", "CENTERS", "STUDENTS", "STAFF","COURSES", "PROCUREMENT", "POST", "ASSESSMENT","CHECK TRACKING","LOGOUT"]
        @State private var selectedFruit: String?
    var body: some View {
        
        VStack {
            
            
            
            Image("logo_1")
            .renderingMode(.original)
            .resizable()
            .frame(width: 100, height: 80, alignment: .center)
            .scaledToFit()
   
            List {
                            ForEach(fruits, id: \.self) { fruit in
                                Text(fruit)
                                    .frame(height:35)
                                    .onTapGesture {
                                        self.selectedFruit = fruit
                                }
                                    .listRowBackground(self.selectedFruit == fruit ? Color.red.opacity(0.3) : Color(UIColor.systemGroupedBackground))
                                    
                            }
        
        }
    }
}
}
struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.white.opacity(0.1))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                print("123")
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                    .onTapGesture {
                        
                        print("123")
                        self.menuClose()
                    }
                Spacer()
            }
        }
    }
}
