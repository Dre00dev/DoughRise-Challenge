//
//  ContentView.swift
//  DoughRiseChallenge
//
//  Created by Andres Pulgarin on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView{
            NavigationView{
                HomeView()
            }
            .tabItem{
                    Image("ic-home")
                        .renderingMode(.template)
                    Text("Home")
                        .font(.navTitle)
            }
            TrendsView()
                .tabItem{
                        Image("ic-trend")
                            .renderingMode(.template)
                        Text("Trends")
                            .font(.navTitle)
                }
            TransactionsView()
                .tabItem{
                    
                        Image("ic-transaction")
                            .renderingMode(.template)
                        Text("Transactions")
                            .font(.navTitle)
                    
                }
            CommunityView()
                .tabItem{
                        Image("ic-community")
                            .renderingMode(.template)
                        Text("Community")
                            .font(.navTitle)
                    
                }
            ProfileView()
                .tabItem{
                    
                        Image("ic-profile")
                            .renderingMode(.template)
                        Text("Profile")
                            .font(.navTitle)
                    
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
