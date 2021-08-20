//
//  Weather.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/17.
//

import Foundation
import SwiftUI

class Devclass{
    var jsonlist = [String:Any]()
    
    func dev(){
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        


        let url = URL(string: "http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst?ServiceKey=%2BwCRgbzfxzDv%2B1%2FbMOFBbxd4W9ki%2FC99aVzcfrZJD9ex2oH4jw5BIO%2FKM2fLzkXrZuloPjp5xM2KwenoMpDWVw%3D%3D&pageNo=1&numOfRows=50&dataType=JSON&regId=11D20602")

        guard let url = url else{return}

        let task = session.dataTask(with: url) {data ,response , error in
            
            guard error == nil else
            {
                print("error")
                return
            }
            guard let content = data else{
                print("no data")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else{
                print("there's no data")
                
                return
            }
            self.jsonlist = json
            print(self.jsonlist)
            
            
            
            
            
        }
        task.resume()
        
    }//func dev
    
    struct Parsingjson{
        
    }
}//class Devlist



