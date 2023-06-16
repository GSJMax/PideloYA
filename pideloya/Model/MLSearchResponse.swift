//
//  MLSearchResponse.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation


/// Modelo Response para https://api.mercadolibre.com/sites/MLM/search?q=
struct mlSearchResult: Decodable{
    let site_id: String?
    let query: String?
    let results: [mlProduct]?
}
