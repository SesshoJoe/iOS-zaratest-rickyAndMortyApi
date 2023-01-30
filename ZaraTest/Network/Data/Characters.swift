//
//  Characters.swift
//  ZaraTest
//
//  Created by JOEDELROSARIO on 29/1/23.
//

import Foundation

struct Characters: Decodable {
    let info: Info?
    let results: [Character]?
}

struct Info: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: Prev?
}

struct Prev: Decodable {
    
}

/*
{
   "id":77,
   "name":"Cowboy Morty",
   "status":"Alive",
   "species":"Human",
   "type":"",
   "gender":"Male",
   "origin":{
      "name":"unknown",
      "url":""
   },
   "location":{
      "name":"Citadel of Ricks",
      "url":"https://rickandmortyapi.com/api/location/3"
   },
   "image":"https://rickandmortyapi.com/api/character/avatar/77.jpeg",
   "episode":[
      "https://rickandmortyapi.com/api/episode/10"
   ],
   "url":"https://rickandmortyapi.com/api/character/77",
   "created":"2017-11-30T14:13:17.371Z"
}
 */

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct Origin: Decodable {
    let name: String?
    let url: String?
}

struct Location: Decodable {
    let name: String?
    let url: String?
}


