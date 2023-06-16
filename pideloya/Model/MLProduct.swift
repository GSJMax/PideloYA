//
//  MLProduct.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation


/// Modelo Datos de producto MercadoLibre
struct mlProduct: Decodable,Identifiable, Hashable {
    
    let id: String?
    let title: String?
    let price: Double?
    let thumbnail_id: String?
    let sold_quantity: Int?
    let available_quantity: Int?
    let official_store_name: String?
    
    
    init(idProd: String, titleProd: String? = nil, priceProd: Double? = nil,imgProd: String?, soldQuantity:  Int?, availableQuantity: Int?, oficialStoreName: String?) {
        self.id = idProd
        self.title = titleProd
        self.price = priceProd
        self.thumbnail_id = imgProd
        self.sold_quantity = soldQuantity
        self.available_quantity = availableQuantity
        self.official_store_name = oficialStoreName
    }
    
    /// Retorna URL de imagen en base al thumbail_id  de producto
    /// - Returns: String Url Imagen compuesta ( https://http2.mlstatic.com/D_NQ_NP_\(thumbnail_id!)-V.jpg)
    func urlMeli() ->String{
        
        return "https://http2.mlstatic.com/D_NQ_NP_\(thumbnail_id!)-V.jpg"
    }
    
}
