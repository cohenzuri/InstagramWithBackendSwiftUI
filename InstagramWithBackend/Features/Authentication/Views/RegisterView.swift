//
//  RegisterView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/9/23.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authVm: AuthenticationViewModel
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            ImagePicker(image: $selectedImage) { image in
                self.selectedImage = image
            }
            
            VStack {
                
                emailTextField
                userNameTextField
                userFullNameTextField
                passwordSecureFieldView
            }
            
            Button {
                authVm.register(email: email, password: password, image: selectedImage, fullName: fullname, userName: username)
            } label: {
                signupButtonView
            }
        }
    }
}

extension RegisterView {
    
    struct DrawingConstants {
        static let textFieldsSize: CGSize = CGSize(width: 350, height: 44)
        static let textFieldscornerRadius: CGFloat = 8
    }
    
    var emailTextField: some View {
        
        TextField("Enter your email", text: $email)
            .frame(width: DrawingConstants.textFieldsSize.width ,height: DrawingConstants.textFieldsSize.height)
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
    }
    
    var userNameTextField: some View {
        
        TextField("Enter your user name", text: $username)
            .frame(width: DrawingConstants.textFieldsSize.width ,height: DrawingConstants.textFieldsSize.height)
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
    }
    
    var userFullNameTextField: some View {
        
        TextField("Full name", text: $fullname)
            .frame(width: DrawingConstants.textFieldsSize.width ,height: DrawingConstants.textFieldsSize.height)
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
    }
    
    var passwordSecureFieldView: some View {
        
        SecureField("Enter your password", text: $password)
        
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
    }
    
    var signupButtonView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 300, height: 44)
            
            Text("Sign Up")
                .padding()
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
