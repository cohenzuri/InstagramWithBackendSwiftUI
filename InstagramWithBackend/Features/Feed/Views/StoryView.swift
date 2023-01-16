//
//  StoryView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/16/23.
//

import SwiftUI

struct StoryView: View {
    
    //@ObservedObject var mainVM: MainViewModel
    var index: Int
    
    var body: some View {
        
        VStack {
            
            //var storyPublisher =  mainVM.getUser(id: mainVM.stories[index].userID)
            //Image(storyPublisher?.profileImage ?? "")
            Image("profile_1")
                .resizable().frame(width: 62, height: 62)
            
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(LinearGradient(gradient: Gradient(colors: [.orange, .red, .purple]), startPoint: .top, endPoint: .bottom), lineWidth: 2.3)
                )
            
            //Text(storyPublisher?.name ?? "")
            Text("zuri_c")
                .foregroundColor(.white)
        }
    }
}

//struct StoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryView(mainVM: .init(), index: 0)
//    }
//}
//
