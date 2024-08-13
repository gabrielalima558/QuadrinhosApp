//
//  QuadrinhosConverter.swift
//  QuadrinhosApp
//
//  Created by Gabriela Lima de Araujo on 13/08/24.
//

import UIKit

class QuadrinhosConverter: NSObject {
    
    func getTitle(data: Data) -> String? {
        var result: String? = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            if let title = json["title"] as? String {
                result = title
            }
        } catch let error as NSError {
            result = "Falha ao carregar \(error.localizedDescription)"
        }
        
        return result
    }
    
    func getNum(data: Data) -> String? {
        var result: String? = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            if let num = json["num"] as? Int {
                result = String(num)
            }
        } catch let error as NSError {
            result = "Falha ao carregar \(error.localizedDescription)"
        }
        
        return result
    }
    
    func getDate(data: Data) -> String? {
        var result: String? = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            if let month = json["month"] as? String, let year = json["year"] as? String{
                result = "Data: \(month)/\(year)"
            }
        } catch let error as NSError {
            result = "Falha ao carregar \(error.localizedDescription)"
        }
        
        return result
    }
    
    func getImage(data: Data) -> String? {
        var result:String? = nil
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            if let urlString = json["img"] as? String {
                result = urlString
            }
        } catch let error as NSError {
            result = "Falha ao carregar \(error.localizedDescription)"
        }
        
        return result
    }

}
