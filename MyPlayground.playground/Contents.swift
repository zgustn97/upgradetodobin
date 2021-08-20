import SwiftyJSON
class Getjson{
    var rnSt:Int = 0
    var rnst:Int = 0
    
    func getJson() {
        
        
        let urlString = URL(string:"http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst?ServiceKey=%2BwCRgbzfxzDv%2B1%2FbMOFBbxd4W9ki%2FC99aVzcfrZJD9ex2oH4jw5BIO%2FKM2fLzkXrZuloPjp5xM2KwenoMpDWVw%3D%3D&pageNo=1&numOfRows=1&dataType=JSON&regId=11D20602")

        guard let url = urlString else{
            print("url is nil")
            return
        }
        let request = URLRequest(url: url)



        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
       

        let datatask = URLSession.shared.dataTask(with: request) { data, response, error  in
            
            guard let datas = data else{
                print("nil")
                return
            }
            guard let json = try? JSON(data: datas) else{
                print("error")
                return
            }
            self.rnSt = json["response"]["body"]["items"]["item"][0]["rnSt"].intValue
//            print(json["response"]["body"]["items"]["item"][0]["rnSt"])
//            print(self.rnSt)
            
        }
        .resume()
        do{ sleep(1)}
        self.rnst = self.rnSt
        
    }//func
    
}//class
var result = Getjson()
result.getJson()
print(result.self.rnst)

