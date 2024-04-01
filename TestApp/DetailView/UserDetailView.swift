//
//  UserDetailView.swift
//  TestApp
//
//  Created by Apple on 3/25/24.
//

import SwiftUI

struct UserDetailView: View {
    let userInfo: User
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            AsyncImage(url: URL(string: userInfo.avatar )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.padding20)
            } placeholder: {
                Rectangle()
                .foregroundColor(.gray)
            }
            .frame(width:Constants.frameSize200, height: Constants.frameSize200, alignment: .center)
            .padding(Constants.padding20)
            HStack() {
                Text(userInfo.firstName)
                Text(userInfo.lastName)
            }
            Spacer()
        }
        }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userInfo: User(id: 123, email: "veeru.sarnala@gmail.com", firstName: "Veerababu", lastName: "Sarnala", avatar: "https://reqres.in/img/faces/2-image.jpg"))
    }
}
