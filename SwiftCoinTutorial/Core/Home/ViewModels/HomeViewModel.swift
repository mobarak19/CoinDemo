//
//  HomeViewModel.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 31/8/22.
//

import SwiftUI

class HomeViewModel:ObservableObject{
    
    @Published var coins = [Coin]()
    @Published var topMoversCoin = [Coin]()

    init(){
        fetchCoinData()
    }

    func fetchCoinData(){
        let urlString  =  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: response code \(response.statusCode)")
            }
            
            guard let data = data else {
                return
            }

            do{
                let coinsList = try? JSONDecoder().decode([Coin].self,from:data)
                print(coinsList)
                guard let coinsList = coinsList else{return}
                DispatchQueue.main.async {
                    self.coins = coinsList
                    self.configureToMovers()
                }
               
            }catch let error{
                print("DEBUG: error \(error.localizedDescription)")
            }
            
        }.resume()
        
        
    }
    
    func configureToMovers(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H>$1.priceChangePercentage24H})
        self.topMoversCoin = Array(topMovers.prefix(5))
    }
}
