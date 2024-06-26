//
//  HomeView.swift
//  AstroBuddies
//
//  Created by ataku x on 11/18/23.
//
//  APIs Used:
//      - Moon Info: https://rapidapi.com/MoonAPIcom/api/moon-phase
//      - Horoscope/Zodiac Sign Info: https://rapidapi.com/Alejandro99aru/api/horoscope-astrology/

import SwiftUI

struct HomeView: View {
    
    // User data
    @EnvironmentObject var viewModel: AuthViewModel
    
    // View Models for certain screens
    @StateObject var todaysMoonModel = GetMoonInfo()
    @StateObject var horoscopeModel = HoroscopeViewModel()
    @StateObject var zodiacInfoModel = ZodiacInfoViewModel()
    
    // For the slide ups
    @State private var isSettingsViewActive = false
    @State private var isHoroscopeViewActive = false
    @State private var isZodiacInfoViewActive = false
    
    // Top edge value
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    // Gradient value for containers
    let contentGradient = Gradient(colors: [Color(red: 0.19, green: 0.16, blue: 0.18).opacity(0), Color(red: 1, green: 0.95, blue: 0.83).opacity(0.23)])
    
    var body: some View {
        // Home Screen
        VStack {
            if let user = viewModel.currentUser {
                ZStack {
                    
                    VStack {
                        
                        // Top bar
                        HStack(spacing: 12) {
                            
                            VStack(spacing: 2){
                                Text(user.username)
                                    .fontWeight(.bold)
                                    .modifier(HeaderModifier())
                                    .padding(.horizontal)
                                
                                Text("☉ \(user.sunSign.rawValue) ☾ moon sign ↑ rising sign")
                                    .font(.subheadline)
                                    .modifier(TextModifier())
                                    .padding(.horizontal)
                            }.padding()
                            
                            Spacer(minLength: 0)
                            
                            Button {
                                isSettingsViewActive.toggle()
                            } label: {
                                Image("settings-icon")
                                    .padding(.vertical)
                                    .padding(.trailing)
                            }
                            .sheet(isPresented: $isSettingsViewActive) {
                                SettingsView()
                                    .interactiveDismissDisabled()
                            }
                            
                            Spacer(minLength: 0)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top, top)

                        // Content on home screen
                        VStack {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                VStack {
                                    // Container holding Horoscope details
                                    VStack {
                                        ZStack {
                                            
                                            // Horoscope title
                                            HStack {
                                                Text("Your Horoscope")
                                                    .fontWeight(.bold)
                                                    .modifier(TitleModifier())
                                                    .frame(alignment: .leading)
                                                    .padding(.horizontal)
                                                
                                            }.padding(.top, 20)
                                            
                                            Spacer()
                                            
                                            // Horoscope details
                                            // Displays horoscope from Horoscope Astrology API from RapidAPI based on user's sun sign
                                            VStack {
                                                Text(horoscopeModel.todayHoroscopeText)
                                                    .modifier(ContentTextModifier())
                                                    .frame(alignment: .leading)
                                                    .padding()
                                            }.padding(.top, 60)
                                                .padding(.bottom, 20)
                                                .onAppear {
                                                    horoscopeModel.fetchHoroscope(sunSign: user.sunSign, time: "today")
                                                }
                                            
                                            Spacer()
                                            
                                            // Read More button to lead to horoscope screen in case there is more to read
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                HStack {
                                                    Button {
                                                        isHoroscopeViewActive.toggle()
                                                    } label: {
                                                        Text("Read More...")
                                                            .fontWeight(.bold)
                                                            .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                            .frame(alignment: .leading)
                                                    }
                                                    .sheet(isPresented: $isHoroscopeViewActive) {
                                                        HoroscopeView()
                                                            .interactiveDismissDisabled()
                                                    }
                                                    .padding(.horizontal)
                                                    .frame(alignment: .leading)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 20)
                                            }
                                        }
                                    }
                                    .frame(height: 312)
                                    .background(
                                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                                    )
                                    .cornerRadius(22)
                                    .contentMargins(20)
                                    .padding(.horizontal)
                                    
                                    
                                    // Container holding Moon details
                                    VStack {
                                        Spacer()
                                        ZStack {
                                            
                                            // Button to lead into moon info screen in case there is more to read
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                HStack {
                                                    HStack {
                                                        // Display the current Moon Phase and an emoji of it
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("Moon Phase:")
                                                                .font(.custom("Inter", size: 26).weight(.bold))
                                                                .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                            
                                                            
                                                            Text(todaysMoonModel.todayMoonPhase)
                                                                .font(.custom("Inter", size: 18).weight(.bold))
                                                                .foregroundColor(Color.accentColor)
                                                                                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        Text(emojiForMoonPhaseString(todaysMoonModel.todayMoonPhase))
                                                            .font(.custom("Inter", size: 50))
                                                            .padding()
                                                            .padding(.trailing, 10)
                                                        
                                                        
                                                    }
                                                    .padding(.top, 20)
                                                    .onAppear {
                                                        todaysMoonModel.fetchMoonPhaseData()
                                                        
                                                    }
                                                    
                                                    .padding(.horizontal)
                                                    .frame(alignment: .leading)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 20)
                                            }
                                        }
                                    }
                                    .frame(height: 100)
                                    .background(
                                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                                    )
                                    .cornerRadius(22)
                                    .contentMargins(20)
                                    .padding()
                                    
                                    
                                    // Container holding Zodiac Sign Details details
                                    VStack {
                                        ZStack {
                                            
                                            // Zodiac Sign title
                                            HStack {
                                                
                                                VStack {
                                                    
                                                    Image("\(user.sunSign)-icon")
                                                        .padding()
                                                    
                                                    Spacer()
                                                }
                                                
                                                Text("\(user.sunSign.rawValue.capitalized):")
                                                    .fontWeight(.bold)
                                                    .modifier(TitleModifier())
                                                    .frame(alignment: .leading)
                                                    .padding(.horizontal)
                                                
                                                Spacer()
                                                
                                            }.padding(.top, 20)
                                                .padding(.bottom, 20)
                                            
                                            Spacer()
                                            
                                            // Zodiac sign details
                                            VStack {
                                                Text(zodiacInfoModel.zodiacInfoText)
                                                    .modifier(ContentTextModifier())
                                                    .frame(alignment: .leading)
                                                    .padding()
                                            }.padding(.top, 60)
                                                .padding(.bottom, 20)
                                                .onAppear {
                                                    zodiacInfoModel.fetchZodiacInfo(sign: user.sunSign.rawValue)
                                                }
                                            
                                            Spacer()
                                            // Read More button to lead to zodiac info screen in case there is more to read
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                HStack {
                                                    Button {
                                                        isZodiacInfoViewActive.toggle()
                                                    } label: {
                                                        Text("Read More...")
                                                            .fontWeight(.bold)
                                                            .foregroundColor(Color(red: 0.73, green: 0.71, blue: 0.98))
                                                            .frame(alignment: .leading)
                                                    }
                                                    .sheet(isPresented: $isZodiacInfoViewActive) {
                                                        ZodiacInfoView()
                                                            .interactiveDismissDisabled()
                                                    }
                                                    .padding(.horizontal)
                                                    .frame(alignment: .leading)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 20)
                                            }
                                        }
                                    }
                                    .frame(height: 312)
                                    .background(
                                        LinearGradient(gradient: contentGradient, startPoint: .top, endPoint: .bottom)
                                    )
                                    .cornerRadius(22)
                                    .contentMargins(20)
                                    .padding(.horizontal)

                                }
                                .scrollTargetLayout()
                            }
                            .padding(.bottom, 90)
                            .scrollTargetBehavior(.viewAligned)
                            
                        }
                        
                    }.modifier(AppBackground())
                    
                }.modifier(AppBackground())
            }
        }.modifier(AppBackground())
    }
}

func emojiForMoonPhaseString(_ phaseString: String) -> String {
    // Function to get the proper emoji for the current moon phase
    
    let camelPhaseStr = convertToCamelCase(phaseString)
    
    switch camelPhaseStr {
        case "NewMoon": return "🌑"
        case "WaxingCrescent": return "🌒"
        case "FirstQuarter": return "🌓"
        case "WaxingGibbous": return "🌔"
        case "FullMoon": return "🌕"
        case "WaningGibbous": return "🌖"
        case "LastQuarter": return "🌗"
        case "WaningCrescent": return "🌘"
        default: return ""
    }
    
}

func convertToCamelCase(_ input: String) -> String {
    // Convert a given string into CamelCase
    let words = input.components(separatedBy: " ")
    let camelCaseWords = words.map { $0.prefix(1).capitalized + $0.dropFirst() }
    let camelCaseString = camelCaseWords.joined()
    return camelCaseString
}
