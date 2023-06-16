//
//  ApiProvider.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation
import Alamofire
/**
 Class
 */
class MLApiService : ObservableObject {
    
    @Published var products: [mlProduct] = [mlProduct]()
    @Published var isSearching: Bool = true
    
    private let ML_site = "MLM"
    private let ML_url = "https://api.mercadolibre.com/sites/"
    private let ML_StatusOK = 200...299
    
    
    @MainActor
    func search(
        strQuery: String,
        sucess: @escaping (_ mls: mlSearchResult) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) async {
        
        isSearching = true
        
        let urlRequest = "\(ML_url)\(ML_site)/search?q=\(getSanitizedString(query: strQuery))"
        //print(urlRequest)
        AF.request(urlRequest, method: .get).validate(statusCode: ML_StatusOK).responseDecodable(of: mlSearchResult.self){
            response in
            
            if let result = response.value{
                self.products = result.results!
                sucess(result)
            }else{
                failure(response.error)
            }
        }
        
        isSearching = false
    }
    
    func getSanitizedString(query: String)->String{
        let cleanString = query.replacingOccurrences(of: "%", with: "", options: .literal, range: nil)
        let sanitizedString = cleanString
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        return sanitizedString
    }
    
    
}
