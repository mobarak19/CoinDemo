//
//  CoinCellView.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 30/8/22.
//

import SwiftUI
import Kingfisher
struct CoinCellView: View {
    let coin:Coin
    var body: some View {
        HStack{
            
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading,spacing: 4){
                Text("\(coin.name)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                Text("\(coin.symbol.uppercased())")
                    .font(.caption)
                    .padding(.leading,6)
            }.padding(2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4){
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)

            }.padding(2)
            
        }.padding(.horizontal)
            .padding(.vertical,4)
    }
}

//struct CoinCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCellView()
//    }
//}
