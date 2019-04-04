//
//  Network.swift
//  ResultType
//
//  Created by Pratik Bhaliya on 4/4/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class Network {
    
    static let sharedInstance = Network()
    
    func fetchCourseJSON(completion: @escaping (Result<[Courses],Error>) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else  {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let erro = error {
                completion(.failure(erro))
                return
            }
            
            //Successful
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data!)
                completion(.success(courses))
            }catch let jsonErr {
                completion(.failure(jsonErr))
            }
            
        }.resume()
    }
    

    func fetchCourseImage(_ urlString: String, closure: @escaping (Result<UIImage,Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error { closure(.failure(err))  }
            
            guard let data = data else { return }
            
            closure(.success(UIImage(data: data)!))
        }.resume()
    }
}
