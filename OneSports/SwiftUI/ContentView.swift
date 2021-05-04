//
//  ContentView.swift
//  OneSports
//
//  Created by Apple on 04/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack { // << moved this up to ZStack
            
            ZStack {

               Image("Background Red Colour")
                   .resizable()
                .scaledToFit().padding(.top)
    
                Image("SreeNidhi Logo")
                    .resizable()
                    .scaledToFit().padding(.top).position(x:50, y: 145).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                
    

}
            
          
            
                    Text("Top Text")
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .font(.body)
            
            
                    Text("Top Teyutxt")
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .font(.body)
            
            
                }
      
        Image("Background Red Colour")
            .resizable()
         .scaledToFit().padding(.top)
            
        
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().body.position(x:160, y: 200.0)
    }
}
