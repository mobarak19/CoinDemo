//
//  HomeView.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 30/8/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel = HomeViewModel()
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                // top movers view

                TopMoversView(viewModel: viewmodel)
                
                Divider()
                
                AllCoinView(viewmodel: viewmodel)
                
                // bottom lits view

            }).navigationTitle("Live Prices")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
