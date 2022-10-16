//
//  Test.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 15.10.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getItems(foodName: String, completion: @escaping(Result<[Item]?, Error>) -> Void)
}

class NetworkDataService: NetworkServiceProtocol {
   
    func getItems(foodName: String, completion: @escaping (Result<[Item]?, Error>) -> Void) {
  
        let api = "8d719020d15c4ccdb1b8d0151a351892"
        let foodURL = "https://api.spoonacular.com/recipes/complexSearch?"
        let food = foodName
        let urlString = "\(foodURL)query=\(food)&number=10&apiKey=\(api)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data = data else { return }
                let items = try JSONDecoder().decode(JsonResults.self, from: data)
                completion(.success(items.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
}


