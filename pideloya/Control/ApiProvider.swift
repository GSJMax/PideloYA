//
//  ApiProvider.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation
import Alamofire

/// Clase encargada de manejar las peticiones para API ML, Hereda de ObservableObject
class MLApiService : ObservableObject {
    
    @Published var products: [mlProduct] = [mlProduct]()
    @Published var isSearching: Bool = true
    
    private let ML_site = "MLM"
    private let ML_url = "https://api.mercadolibre.com/sites/"
    private let ML_StatusOK = 200...299
    
    
    @MainActor
    /// Realiza una peticion a https://api.mercadolibre.com/sites/MLM/search?q=
    /// agregando los datos de consulta del tipo "String%20String..."
    ///  - Parameters:
    ///    - strQuery: in UserInputString
    ///    - sucess: out Sucess Data
    ///    - failure: out Error Data
    ///
    ///
    func search(
        strQuery: String,
        sucess: @escaping (_ mls: mlSearchResult) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) async {
        
        isSearching = true
        
        let urlRequest = "\(ML_url)\(ML_site)/search?q=\(getSanitizedURLString(query: strQuery))"
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
    
    /// Sanitiza un objeto de tipo String y genera un nuevo string con el formato String%20String... para su uso en el API de ML
    /// - Parameter query: String UserInput Eje: "String String %"
    /// - Returns: retorna un objeto de tipo String Sanitizado  Eje: "String%20String"
    func getSanitizedURLString(query: String)->String{
        let cleanString = query.replacingOccurrences(of: "%", with: "", options: .literal, range: nil)
        let sanitizedString = cleanString
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        return sanitizedString
    }
    
    
}
