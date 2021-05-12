import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                VStack{
                               Image("Background Red Colour")
                                   .resizable()
                                   .scaledToFill().padding(.top)
                                .frame(maxWidth: .infinity)
                                .frame(maxHeight:250)
                         
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                   
                }
                VStack {
                    VStack(alignment: .center) {
                                  Image("logo_1")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 260, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                   
                                    .padding(.top, -115)
                       
                    }
                 VStack(spacing: 30) {
                           
                        Text("Discover best sports academy from over 1000 sports academy ")
                            .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                    
                   
                    NavigationLink(destination: login()) {
                                              Text("Login")
                                                  .frame(width: 300, height: 30, alignment: .center)
                                                  .padding()
                                                  .foregroundColor(.white)
                                                  .background(Color.red)
                                                  .cornerRadius(35)
                                              
                                              
                    }.padding(.bottom,1)
                                          
                    
                    Button(action: {
                           print("sign up bin tapped")
                       }) {
                           Text("Create an Account")
                            .frame(width: 300, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                               .font(.system(size: 18))
                            .padding()
                               .foregroundColor(.red)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 35)
                                       .stroke(Color.red, lineWidth: 2)
                           )
                    }.padding(.top,-10)
                    
                    Text("Or login with")
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding(.top,-20)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
                        Button(action: {
                               print("sign up bin tapped")
                           }) {
                              
                               
                            Image("facebook")
                                .resizable()
                            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                   
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.blue, lineWidth: 2)
                               )
                           }
                        Button(action: {
                               print("sign up bin tapped")
                           }) {
                              
                               
                            Image("apple")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.bottom,5)
                                .padding(.top,5)
                                .padding(.leading,5)
                                .padding(.trailing,5)
                                
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.black, lineWidth: 2)
                               )
                           }
                        
                        Button(action: {
                               print("sign up bin tapped")
                           }) {
                              
                               
                            Image("Google")
                                .resizable()
                            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.bottom,5)
                                .padding(.top,5)
                                .padding(.leading,5)
                                .padding(.trailing,5)
                                
                                
                                   
                                   
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 35)
                                           .stroke(Color.red, lineWidth: 2)
                               )
                           }
                       
                    }.padding(.bottom,80)
                    
                
               Spacer()
                }
                  Spacer()
                }
    }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
