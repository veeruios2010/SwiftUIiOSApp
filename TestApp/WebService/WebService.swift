//
//  WebService.swift
//  TestApp
//
//  Created by Apple on 3/23/24.
//

import Foundation

class WebService {
    static let shared = WebService()
    
    private init() {
        
    }
    
    func getUsers() async throws -> [User] {
        let urlString = "\(Constants.APIEndPoints.baseUrl)\(Constants.APIEndPoints.getUsersList)"
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(UsersList.self, from: data).users
            
        } catch {
            throw UserError.invalidData
        }
    }
}
