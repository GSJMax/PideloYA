//
//  MLProduct.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import Foundation

/**
 
 Genera un objeto
*/
struct mlProduct: Decodable,Identifiable, Hashable {
    
    let id: String?
    let title: String?
    let price: Double?
    let thumbnail_id: String?
    let sold_quantity: Int?
    let available_quantity: Int?
    
    init(idProd: String, titleProd: String? = nil, priceProd: Double? = nil,imgProd: String?, soldQuantity:  Int?, availableQuantity: Int?) {
        self.id = idProd
        self.title = titleProd
        self.price = priceProd
        self.thumbnail_id = imgProd
        self.sold_quantity = soldQuantity
        self.available_quantity = availableQuantity
    }
    
    func urlMeli() ->String{
        
        return "https://http2.mlstatic.com/D_NQ_NP_\(thumbnail_id!)-V.jpg"
    }
    
}
