//
//  AccountSettings.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 20/01/2026.
//

import SwiftUI





struct AccountSettings: View {
    
    @State private var username: String = ""
@State private var password: String = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Text("Account Settings")
                Spacer()
                
                Text("Log in")
                    
                
                
                TextField("Username", text: $username)
                    .padding(10)
                    .frame(width: 300)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.username)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                
                SecureField("Password", text: $password)
                    .padding(10)
                    .frame(width: 300)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.password)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                Spacer()
                
                
                Button("Create Account") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .buttonStyle(.bordered)
                
                
                Button("Continue as Guest") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .buttonStyle(.bordered)
                
                
            }
        }
   
    }
}
#Preview {
    AccountSettings()
}
