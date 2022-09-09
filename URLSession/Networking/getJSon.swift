//
//  getJSon.swift
//  URLSession
//
//  Created by Kim Nghĩa on 08/09/2022.
//

import Foundation

var newlists = [List]()

func getJSon(complete: @escaping () -> ()) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    let task1 = URLSession.shared.dataTask(with: url!) { data, response, err in
        if err == nil {
            do{
                newlists = try JSONDecoder().decode([List].self, from: data!)
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
