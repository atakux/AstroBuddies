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
    
    @State var sunSign: Starsign?
    
    var body: some View {
        VStack {
            // TODO: integrate InputView to add field views for date of birth, time of birth, place of birth
            // TODO: maybe integrate google maps API for place of birth to auto-complete user's place of birth
            // TODO: add all those details to the database linked to the user
            

            ScrollView {
                Spacer()
                VStack(spacing: 0) {
                    Spacer()
                    
                    VStack {
                        Text("Enter your date of birth:")
                            .modifier(HeaderModifier())
                            .frame(alignment: .leading)
                        
                        DatePicker("Date of Birth", selection: $selectedDateTime, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(Color(red: 0.73, green: 0.74, blue: 0.83).opacity(0.8))
                            .cornerRadius(10)


                        Spacer()
                        
                        Text("Enter your time of birth:")
                            .modifier(HeaderModifier())
                            .frame(alignment: .leading)
                        
                        DatePicker("Time of Birth", selection: $selectedDateTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(Color(red: 0.73, green: 0.74, blue: 0.83).opacity(0.8))
                            .cornerRadius(10)
                            
                    }
                    .padding()
                    
                    
                    
                    
                    Button {
                        sunSign = Starsign.getSunSign(selectedDateTime)
                        print(sunSign?.sign ?? "invalid")
                        
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
                        
                        // TODO: Store date and time of birth in the database
                        
                        
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
