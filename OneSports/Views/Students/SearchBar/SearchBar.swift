//
//  SearchBar.swift
//  OneSports
//
//  Created by apple on 02/06/21.
//

import SwiftUI
 
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("SEARCH STUDENT", text: $text)
                .frame(height:40)
                .padding(7)
            
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
 
                }) {
                    Text("Cancel")
                       
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
struct ToDoItem: Identifiable,Hashable {
    var id = UUID()
    var name: String = ""
   
    var isComplete: Bool = false
}
