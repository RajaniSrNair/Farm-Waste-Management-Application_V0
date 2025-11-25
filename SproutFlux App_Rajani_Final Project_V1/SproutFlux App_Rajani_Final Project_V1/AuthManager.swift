//
//  AuthManager.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/5/25.
//

import Foundation

//Setting up a class and making it observable by SwiftUI. views will refresh automatically when certain properties change

final class AuthManager: ObservableObject {

//representing authentication state of the app
// isSignedIn- whether someone is logged in. initialized as false
// currentUser- details of the logged-in user. nil if nobody is
// @Published- SwiftUI views observing this class will automatically update when these values changes
//private(set) only this class can modify these values and other parts can read them
//storageKey is a constant used to save and retrieve data in userDefaults
    

    @Published private(set) var isSignedIn: Bool = false
    @Published private(set) var currentUser: User?
    private let storageKey = "sproutflux_user"
    
    //ensuring that the app "remembers" the user last signed in
   
    init() {             //checks when app starts if there's a saved user session
        loadUser()      //restore previously signed in user from storage (if any)
    }
    
 //simulating signing in a user in the mock login
//checking email and password are not empty
    //simulating a delay like waiting for a real server
    
    func signInMock(email: String, password: String) async throws{
        guard !email.isEmpty, !password.isEmpty else{
            throw AuthError.invalidCredentials
        }
        //simulate network latency
        try await Task.sleep(nanoseconds: 500*1_000_000)
        let user = User(id: UUID().uuidString, name: email.components(separatedBy:"@").first ?? "User", email: email)
//extracting first part of email for name. if email is not there, use "User" instead
        saveUser(user)     //saves User object to persistent storage-userDefaults
        await MainActor.run {
            self.currentUser = user   //updates currentUser
            self.isSignedIn = true    //updates isSignedIn. Notifies UI that user is now signed in
        }
    }
    func signOut() {                   //logging out function
        currentUser = nil              //clears user data from memory & storage
        isSignedIn = false             //set false. UI --> logged out state
        UserDefaults.standard.removeObject(forKey: storageKey)
    }
    private func saveUser(_ user: User) {  //converts user data into JSONEncoder
        if let d = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(d, forKey: storageKey)
            
        } //saves User object (now converted into JSONEncoder data) into persistent storage- userDEfaults.
        //Ensures that user info remains available next time
        
    }
    private func loadUser(){
        guard let d = UserDefaults.standard.data(forKey: storageKey),
              let u = try? JSONDecoder().decode(User.self, from: d)
        else {
            self.isSignedIn = false
            self.currentUser = nil
            return
        }
        self.currentUser = u
        self.isSignedIn = true
                
    } //reads the saved user from UserDEfaults when the app launches
    //once valid data is found, it's decoded back to User obj. mark as signedin
    //reset to signed-out state if valid data not found
    func signInGuest(_ user: User) {
        saveUser(user)
        currentUser = user
        isSignedIn = true
    }
    
    enum AuthError: LocalizedError {  //allows readable message for UI to display
        case invalidCredentials   //defines custom errors AuthManager can throw
        var errorDescription: String? {
            switch self{
            case .invalidCredentials: return "Please enter email and password."
            }
            
        }
    }
    
}



//final class modifier prevents another class from extending the class.cannot be subclassed from or inherited from
//ObservableObject protocol. SwiftUI views can observe the conforming class for changes
//@Published property wrapper automatically creates a publisher for <>. when <> value changes, any objects observing this property are notified
//private(set). access control modifier. property can be read(get) from wnywhere within the module, but can be written to(set) from within the class or struct. read-only public property
