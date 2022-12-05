//
//  Model.swift
//  RealApp
//
//  Created by Süleyman Arslan on 2.12.2022.
//

import Foundation

struct Photo{
    
    //var albumId: Int
    //var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    var description: String
    
    init(_ dictionary: [String: Any]){
        //self.albumId = dictionary["albumId"] as? Int ?? 0
        //self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["link"] as? String ?? ""
        self.thumbnailUrl = dictionary["resim"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""


    }
}

struct Comment{
    
    //var albumId: Int
    //var id: Int
    //var title: String
    //var url: String
    //var thumbnailUrl: String
    var description:String
    
    init(_ dictionary: [String: Any]){
        //self.albumId = dictionary["albumId"] as? Int ?? 0
        //self.id = dictionary["id"] as? Int ?? 0
       // self.title = dictionary["title"] as? String ?? ""
       // self.url = dictionary["link"] as? String ?? ""
       // self.thumbnailUrl = dictionary["resim"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
    }
}
