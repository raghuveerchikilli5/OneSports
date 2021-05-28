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
    @State var images = [UIImage(named: "Centre"),UIImage(named: "Centre"),UIImage(named: "Centre"),UIImage(named: "Centre"),UIImage(named: "Centre"),UIImage(named: "Centre"),UIImage(named: "Centre")]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
           
        ]
    var body: some View {
        
        
        NavigationView {
            ScrollView(.vertical) {
           
                VStack {
                    HStack{
                        Button(action: {
                                                   
                                                       
                                                       
                                        print("apple sign in")
                            }) {
                                                       
                                                       
                                Image("iconfinder_menu_3324998")
                                .resizable()
                                    .padding(.leading,10)
                                .frame(width: 50, height: 50, alignment: .leading)
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
                    .background(Color.red)
                    
                    .onAppear {
                        
                        
                        dashboardData()
                       
                        print("dddd",dashboardCount)
                                    print("ContentView appeared!")
                                }
                    
                    Spacer()
                    
                    VStack {
                        if needRefresh == true {
                        LazyVGrid(columns: columns) {
                            ForEach(0...dashboardCount!-1, id: \.self) { index1 in
                                
                                VStack {
                                       
                               
                                    Image(uiImage: images[index1]!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width / 2.5, height: 200)
                                    
                                    Text("\(keys1[index1]) \(values1[index1])")
                                            .frame(width: 100, height: 30, alignment: .center)
                                            .padding(.bottom, 20)
                                           .font(.system(size:15))
                                            .font(Font.headline.weight(.bold))
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
    
}
        .navigationBarTitle("")
                        .navigationBarHidden(true)
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
                            for i in data.keys {
                                keys1.append(i)
                            }
                            for i in data.values {
                                values1.append(i as! Int)
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
