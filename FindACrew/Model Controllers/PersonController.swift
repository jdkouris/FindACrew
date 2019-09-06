//
//  PersonController.swift
//  FindACrew
//
//  Created by John Kouris on 9/5/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

class PersonController {
    
    private let baseURL = URL(string: "https://swapi.co/api/people")
    var people = [Person]()
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func searchForPeople(with searchTerm: String, completion: @escaping () -> Void) {
        
        guard let baseURL = baseURL else {
            completion()
            return
        }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Request URL is nil")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from the data task.")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                print("Unable to decode data into PersonSearch object: \(error)")
            }
            completion()
            
        }.resume()
        
    }
    
}
