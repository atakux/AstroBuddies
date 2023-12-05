//
//  CompatibilityView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/19/23.
//

import SwiftUI

struct CompatibilityView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var selectedSign: String = "Aries"
    @StateObject private var compatViewModel = CompatibilityViewModel()
    
    
    
    // Gradient for the background
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    

    var body: some View {
        VStack {
            if let user = viewModel.currentUser {
                VStack {
                    // Top bar
                    VStack {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Spacer(minLength: 2)
                                    
                                    // Compatibility Title
                                    Text("Compatibility")
                                        .font(.title)
                                        .foregroundColor(Color(red: 0.96, green: 0.82, blue: 0.44))
                                        .frame(alignment: .center)
                                        .padding(.top, top)
                                    
                                    Spacer()
                                    
                                }.padding(.horizontal)
                                    .padding(.leading, 10)
                            }
                            .padding(.horizontal)
                        }.frame(alignment: .leading)
                    }
                    
                    
                    // Zodiac Sign Picker
                    HStack(alignment: .top) {
                        VStack(alignment: .center) {
                            Picker("Select Zodiac Sign", selection: $selectedSign) {
                                ForEach(["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"], id: \.self) { sign in
                                    Text(sign)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .padding()
                            .frame(height: 175)
                        }.frame(height: 175)
                    }.padding(.bottom)
                        .frame(height: 150)
                        .cornerRadius(22)
                          
                    // Compatibility Data Display
                    VStack {
                        List(compatViewModel.compatibilityData, id: \.header) { item in
                            VStack(alignment: .leading) {
                                Text(item.header)
                                    .font(.headline)
                                    .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                
                                Text(item.text)
                                    .font(.body)
                                    .font(.custom("Inter", size: 16))
                                    .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.88))
                            }
                            .listRowBackground(LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom))
                            
                        }
                        .cornerRadius(22)
                        .listStyle(PlainListStyle())
                    }
                    .cornerRadius(22)
                    
                }
                .onChange(of: selectedSign) { newSign in
                    // Fetch compatibility data when the view appears
                    compatViewModel.fetchCompatibility(sign1: user.sunSign.rawValue.capitalized, sign2: newSign)
                }
                .onAppear {
                    // Fetch compatibility data when the view appears
                    compatViewModel.fetchCompatibility(sign1: user.sunSign.rawValue.capitalized, sign2: selectedSign)
                }
                .padding(.bottom, 90)
            }
            
        }.modifier(AppBackground())
    }
}
