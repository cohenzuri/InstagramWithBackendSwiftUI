//
//  LoginView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/9/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authVm: AuthenticationViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                backgound
                
                VStack {
                    
                    Spacer()
                    
                    Group {
                        
                        Image(uiImage: UIImage(named: Theme.Images.instagram_text_logo)!)
                        username
                        passwordView
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        forgotPassword
                        
                    }
                    
                    Button {
                        
                    } label: {
                        login
                    }
                    
                    VStack(spacing: 40) {
                        
                        loginWithFacebook
                        
                        
                        Text("OR")
                            .foregroundColor(.gray)
                            .font(.headline)
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            signup
                        }
                        
                    }
                    
                    Spacer()
                    
                    Text("Instagram from Facebook")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

extension LoginView {
    
    struct DrawingConstants {
        static let textFieldsSize: CGSize = CGSize(width: 350, height: 44)
        static let textFieldscornerRadius: CGFloat = 8
    }
    
    var backgound: some View {
        
        Theme.Colors.app_backgound
            .ignoresSafeArea()
    }
    
    var username: some View {
        
        TextField("Enter your email", text: $email)
            .frame(width: DrawingConstants.textFieldsSize.width ,height: DrawingConstants.textFieldsSize.height)
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
    }
    
    var passwordView: some View {
        
        SecureField("Enter your password", text: $password)
        
            .frame(width: 350,height: 44)
            .foregroundColor(.white)
            .background(Theme.Colors.text_field_backgound)
            .border(.black)
            .cornerRadius(8)
        
    }
    
    var loginWithFacebook: some View {
        
        Button {
            print("did tap login with facebook")
        } label: {
            
            HStack{
                Image(Theme.Images.facebook_icon).resizable().frame(width: 17, height: 17)
                Text("Log in with Facebook")
            }
        }
    }
    
    var signup: some View {
        
        HStack {
            
            Text("Don't have an account?")
                .foregroundColor(.gray)
            
            Text("Sign up.")
            
                .foregroundColor(Theme.Colors.app_blue)
        }
    }
    
    var login: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 300, height: 44)
            
            Text("Log in")
                .padding()
                .foregroundColor(.white)
                .font(.headline)
        }
    }
    
    var forgotPassword: some View {
        
        Button {
            print("did tap forgot password?")
        } label: {
            Text("Forgot password?")
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
