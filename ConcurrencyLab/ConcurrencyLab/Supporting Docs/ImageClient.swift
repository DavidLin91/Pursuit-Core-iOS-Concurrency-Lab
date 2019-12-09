//
//  ImageClient.swift
//  ConcurrencyLab
//
//  Created by David Lin on 12/9/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit
struct ImageClient {

    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {

        guard let url = URL(string: urlString) else {
            fatalError("bad url \(urlString)")
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, repsonse, error) in
            if let error = error {
                print("error: \(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}

