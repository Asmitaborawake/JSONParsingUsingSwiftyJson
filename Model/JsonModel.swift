//
//  JsonModel.swift
//  JsonParseUsingSwiftyJSONDemo
//
//  Created by Asmita Borawake on 20/12/21.
//

import Foundation
import SwiftyJSON

struct JsonModel{
    var artistName : String = ""
    var trackCensoredName : String = ""
    var artworkUrl100 : String = ""
    
    init(){
        
    }
    
    
    init(json:JSON){
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
