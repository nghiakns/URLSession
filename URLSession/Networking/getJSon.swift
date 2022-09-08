//
//  getJSon.swift
//  URLSession
//
//  Created by Kim Nghĩa on 08/09/2022.
//

import Foundation

var heros = [HeroStats]()

func getJSon(complete: @escaping () -> ()) {
    let url = URL(string: "https://api.opendota.com/api/heroStats")
    
    let task1 = URLSession.shared.dataTask(with: url!) { data, response, err in
        if err == nil {
            do{
                heros = try JSONDecoder().decode([HeroStats].self, from: data!)
                DispatchQueue.main.sync {
                    complete()
                }
            }
            catch{
                print("error fetching data from api")
            }
        }
    }
    task1.resume()
}
