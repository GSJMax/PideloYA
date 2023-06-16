//
//  MLSearchResponse.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation


struct mlSearchResult: Decodable{
    let site_id: String?
    let query: String?
    let results: [mlProduct]?
}
