//
//  BirthInfoView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct BirthInfoView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            // TODO: integrate InputView to add field views for date of birth, time of birth, place of birth
            // TODO: maybe integrate google maps API for place of birth to auto-complete user's place of birth
            // TODO: add all those details to the database linked to the user
            
            Text("birth details page part of registration")
            
        }.modifier(AppBackground())
    }
}

struct BirthInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BirthInfoView()
    }
}
