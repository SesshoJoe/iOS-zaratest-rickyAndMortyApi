//
//  NetworkingProvider.swift
//  ZaraTest
//
//  Created by JOEDELROSARIO on 29/1/23.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://rickandmortyapi.com/api/"
    private let kStatusOk = 200...299
    
    func getCharacters(success: @escaping (_ characters: Characters) -> (), error: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(self.kBaseUrl)character"
        
        AF.request(url, method: .get).validate(statusCode: self.kStatusOk).responseDecodable(of: Characters.self) {
            response in
            if let characters = response.value {
                success(characters)
            } else {
                error(response.error)
            }
        }
    }
    
    func getCharacter(id: Int, success: @escaping (_ character: Character) -> (), error: @escaping (_ error: Error?) -> ()) {
        
        let url = "\(self.kBaseUrl)character/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: self.kStatusOk).responseDecodable(of: Character.self) {
            response in
            if let character = response.value {
                success(character)
            } else {
                error(response.error)
            }
        }
    }
    
    
}
