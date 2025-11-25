//
//  LoginView.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/6/25.
//
//the screen lets the user sign in using an email and password (mocked in this version) or continue as a guest (without credentials)

//communicates with AuthManager to update whether the user is signed in
//ContentView observes auth.isSignedIn and switches interface between login screen and main screen once user is authenticated

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth: AuthManager
    //gives access to AuthManager instance to call sign-in methods
    //@EnvironmentObject shares an instance of an ObservableObject across multiple views
        
    @State private var email = ""   //stores what user types into text fields
    @State private var password = ""
    @State private var isSigningIn = false //tracks whether sign-in attempt is in progress to show a loading spinner
    @State private var showError = false   //controls whether an alert is displayed
    @State private var errorMessage = ""  //stores error message to display in alert
    
    var body: some View {
        NavigationStack{
            VStack (spacing: 16) {  //UI elements vertical space- 16 points
                Spacer()
                
                Text("SproutFlux") .font(.largeTitle) .bold() .foregroundColor(.green)
                
                TextField("Email", text: $email) .autocapitalization(.none) .textContentType(.emailAddress) //for user input
                //$email bind the text filed to email stste property- automatic changes
                
                    .padding() .background(.regularMaterial) .cornerRadius(8) .padding (.horizontal)
                //.background(.regularMaterial) gives semi-transparent background
                
                SecureField("Password", text: $password)
                    .textContentType(.password) .padding() .background(.regularMaterial) .cornerRadius(8) .padding(.horizontal)
                //SecureField hides the typed text
                
                Button {      ///Sign-In Button
                    
                    signInTapped()
                    
                } label: {
                    
                    if isSigningIn {  //when isSigningIn is T--> spinner (ProgressView)
                        ProgressView()
                        
                    } else {
                        Text("Sign In") .bold() .frame(maxWidth: .infinity)}
                    
                    }
                .disabled(isSigningIn) //prevents user from tapping again while signing in is in progress
                
                .padding()
                .background(Color.green) .foregroundColor(.white) .cornerRadius(10) .padding(.horizontal)
                
                //Guest Login Button
                
                Button("Continue as Guest") {
                    
                    let guest = User(id: UUID() .uuidString, name: "Guest", email: "guest@sproutflux")
                    //creates a simple "guest" user object
                    
                    auth.signOut()  //first clear any existing user
                    auth.signInGuest(guest)   //marks guest as signed in
                }
                .padding(.top,6)
                
                Spacer()
            
            }
            .navigationTitle("Sign In")
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    func signInTapped() {
        isSigningIn = true
        Task {
            do {
                try await auth.signInMock(email: email.trimmingCharacters(in: .whitespaces), password: password)
            } catch {
                errorMessage = error.localizedDescription
                showError = true
            }
            isSigningIn = false
        }
    }
}

#Preview{
    LoginView()
}
