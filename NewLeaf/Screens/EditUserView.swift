//
//  EditUserView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/10/22.
//

import Foundation
import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var currentUser: ViewUserProfileModel
    @ObservedObject var userModel = viewUserModel()
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var bio = "bio"
    @State private var username = "username"
    @State private var location = "location"
    @State var statusMessage = ""
    
    init(nBio: String, nLocation: String, nUsername: String) {
        
          _bio = State(initialValue: nBio)
          _username = State(initialValue: nUsername)
          _location = State(initialValue: nLocation)
    }
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Edit User Profile")
                    .font(.title)
                image?
                    .resizable()
                    .cornerRadius(50)
                    .padding(.all, 4)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .scaledToFit()

                Button("Update photo") {
                    showingImagePicker.toggle()
                    print("user profile pic updated")
                }

                TextField("Username", text: $username)
                    .padding(12)
                    .background(lightGreyColor)
                TextEditor(text: $bio)
                    .padding(12)
                    .background(lightGreyColor)
                TextField("Location", text: $location)
                    .padding(12)
                    .background(lightGreyColor)
                
            Button {
                userModel.updateUser(uid: currentUser.currentUser.id, bio: bio, location: location, username: username)
                statusMessage = userModel.successMessage
            } label: {
                HStack {
                    Spacer()
                    Text("Update Profile")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        
                    Spacer()
                }
                .background(Color.green)
                .cornerRadius(10)
                .frame(width: 200)
                }
                Text(statusMessage)
                    .foregroundColor(.red)
                   
            }
            }
            .padding()
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
        
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
}



struct editUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(nBio: "Bio", nLocation: "Location", nUsername: "username").environmentObject(ViewUserProfileModel())
    }
}
