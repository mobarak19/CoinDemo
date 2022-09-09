//
//  TopMoversView.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 30/8/22.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel:HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers").font(.headline)
            ScrollView(.horizontal){
                HStack(spacing:12){
                    ForEach(viewModel.topMoversCoin){coin in
                        TopMoversItemView(coin:coin)
                    }
                }
            }
        }.padding()
        
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
