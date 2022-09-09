//
//  postJSon.swift
//  URLSession
//
//  Created by Kim Nghĩa on 09/09/2022.
//

import Foundation
func postJSon(complete: @escaping () -> ()){
    let json: [String: Any] = [
        "albumId": 1,
        "title": "abc",
        "url": "abc.com",
        "thumbnailUrl": "anksd.com"
    ]

    let jsonData = try? JSONSerialization.data(withJSONObject: json)

    // create post request
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")! //PUT Your URL
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // insert json data to the request
    request.httpBody = jsonData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let responseJSON = responseJSON as? [String: Any] {
            DispatchQueue.main.sync {
                complete()
            }
            print("This is new JSon: \(responseJSON)") //Code after Successfull POST Request
            
        }
    }

    task.resume()}
