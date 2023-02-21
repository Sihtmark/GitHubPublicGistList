//
//  ViewModel.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class ViewModel: ObservableObject {
    
    @Published var isFiltered = false
    @Published var gists = [Gist]()
    @Published var owner = ""
    
    func fetchData(by owner: String, page: Int, completion: @escaping (Result<[Gist], NetworkError>) -> Void) {
        let url: URL
        if isFiltered == true {
           url = URL(string: "https://api.github.com/users/\(owner)/gists")!
        } else {
            url = URL(string: "https://api.github.com/gists/public?per_page=50&page=\(page)")!
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let gists = try decoder.decode([Gist].self, from: data)
                completion(.success(gists))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func loadGists(owner: String, page: Int) {
        fetchData(by: owner, page: page) { Result in
            switch Result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.gists.append(contentsOf: success)
                }
            case .failure(.serverError):
                print("Server Error")
            case .failure(.decodingError):
                print("Decoding Error")
            }
        }
    }
}
