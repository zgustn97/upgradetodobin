//
//  Myrealmdata.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/09.
//

import RealmSwift
import SwiftUI


class Myrealmdata:Object {
    @objc dynamic var content: String = ""
  

}

let realm = try! Realm()


func inPutdata(input:String){



    let data_r = Myrealmdata()


    data_r.content = input
    do{
        try realm.write{
            realm.add(data_r)
        }
    } catch{
        print("error")
    }
    
}
func loadData() -> Array<String> {
    let data:Results<Myrealmdata>
    data = realm.objects(Myrealmdata.self)
//    ForEach(data ,id:\.self){(loded) in Text(loded.content) }
//    var arry = Array(data)
    var arr:Array = [String]()
    for datas in data{
        arr.append(datas.content)
    }
    return arr
    }


func indexingData(arr:Array<String>){
    for cnt in arr {
        inPutdata(input: cnt)
    }//for
    }//indexingData

func deleteData(){
    do{
        try realm.write{
            realm.delete(realm.objects(Myrealmdata.self))
        }
    } catch {
        print("Error Delete \(error)")
    }
}
