//
//  BirthInfoView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct BirthInfoView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedDateTime: Date = .now // Combine date and time into a single property
    @State var placeOfBirth: String = ""
    
    @State var sunSign: Starsign?
    
    
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
    var body: some View {
        
        VStack(spacing: 12) {
            // TODO: maybe integrate google maps API for place of birth to auto-complete user's place of birth

            Spacer()
            
            ScrollView(.vertical, showsIndicators: true) {
                Spacer()
                
                VStack(spacing: 12) {
                    Spacer()
                    
                    VStack(spacing: 30) {
                        
                        Spacer()
                        
                        // Get user's date of birth from DatePicker
                        Text("Enter your date of birth:")
                            .modifier(HeaderModifier())
                            .frame(alignment: .leading)
                        
                        DatePicker("Date of Birth", selection: $selectedDateTime, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(Color(red: 0.73, green: 0.74, blue: 0.83).opacity(0.8))
                            .cornerRadius(10)


                        Spacer()
                        
                        // Get user's time of birth from DatePicker
                        Text("Enter your time of birth:")
                            .modifier(HeaderModifier())
                            .frame(alignment: .leading)
                        
                        DatePicker("Time of Birth", selection: $selectedDateTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(Color(red: 0.73, green: 0.74, blue: 0.83).opacity(0.8))
                            .cornerRadius(10)
                        
                        
                        // TODO: maybe integrate a google maps API to autocomplete it for the user
                        // Get user's place of birth
                        Text("Enter your place of birth:")
                            .modifier(HeaderModifier())
                        
                        InputView(text: $placeOfBirth, placeholder: "Place of Birth")
                            
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Submit selected user data into database in Firebase
                    Button {
                        
                        let calendar = Calendar.current
                        let dateComponents = calendar.dateComponents([.year, .month, .day], from: selectedDateTime)
                        let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedDateTime)
                        
                        
                        // Store date and time in separate variables
                        
                        // Date:
                        let date = calendar.date(from: dateComponents) ?? Date()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM-dd-yyyy"
                        let dateOfBirth = dateFormatter.string(from: date)
                        
                        // Time:
                        let time = calendar.date(from: timeComponents) ?? Date()
                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "HH:mm"
                        let timeOfBirth = timeFormatter.string(from: time)
                        
                        sunSign = Starsign.getSunSign(selectedDateTime)
                        print(sunSign!)
                        
                        
                        // TODO: Store date and time of birth in the database
                        // TODO: Store user's sun sign, moon sign, and rising sign in database
                        
                        // dateOfBirth, timeOfBirth, placeOfBirth added by hyson 20231208
                        Task {
                            try await viewModel.signUp(withUsername:username, email: email, password: password, sunSign: sunSign!, dateOfBirth: date, timeOfBirth: timeOfBirth, placeOfBirth: placeOfBirth)
                        }
                        
                        
                    } label: {
                        Text("Submit")
                            .modifier(ButtonTextModifier())
                    }
                    .modifier(ButtonModifier())
                    
                    
                }.scrollTargetLayout()
            }.scrollTargetBehavior(.viewAligned)
            
        }.modifier(AppBackground())
        
    }
}
