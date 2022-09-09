//
//  AllCoinView.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 30/8/22.
//

import SwiftUI

struct AllCoinView: View {
    
    @StateObject var viewmodel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline).padding()
            HStack{
                Text("Coin")
                Spacer()
                Text("Prices")
            }.font(.caption).padding(.horizontal).foregroundColor(.gray)
            
            VStack{
                ForEach(viewmodel.coins){coin in
                    CoinCellView(coin:coin)
                }
            }
        }
    
    }
}

//struct AllCoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinView()
//    }
//}
