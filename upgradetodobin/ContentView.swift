//
//  ContentView.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/06.
//
//텝 제스쳐를 통해 선택한 항목을 알 수 있고 남은 것은 선택한 항목을 프린트 문을 이용해 선택한 항목들을 나열하고 한번에 노티피케이션 요청

import SwiftUI
import RealmSwift

class observedstruct:ObservableObject {
    var arr:Array = loadData()
    @Published var textlist = [String]()
    
    @Published var data:Results<Myrealmdata> = realm.objects(Myrealmdata.self)
    //arr를 처음에 textlidst에 넣음
    init(){
        textlist = arr
    }
}


struct ContentView: View {
    
    @State private var input:String = ""
    @ObservedObject var obser = observedstruct()
    @State var check:Bool = false
    
    var body: some View {
 
            VStack{
                HStack{
                    TextField("input", text: $input).padding(10)
                    Button(action: {
                        //                    inPutdata(input: input)
                        //                    obser.data = realm.objects(Myrealmdata.self)
                        
                        obser.textlist.append(input)
                        deleteData()
                        indexingData(arr: obser.textlist)
                        print(obser.textlist)
                        print(realm.objects(Myrealmdata.self))
                            
                        //행동을 취하면 저장소를 비우고 현재 배열로 업데이트
                    }, label: {
                        Text("Button")
                    }).padding(10).cornerRadius(3.0).background(Color.blue).foregroundColor(.yellow)
                }
                
                
                
                
                //Hstack
                HStack{
                    Button(action:{ authorize_Noti()}, label: {
                        Text("알림수락").background(Color.blue).foregroundColor(.yellow).cornerRadius(3.0)
                    })//button
                    Button(action: {notifySchedule(t: obser.textlist[0])}, label: {
                        Text("알림 설정").background(Color.blue).foregroundColor(.yellow).cornerRadius(3.0)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("삭제").background(Color.blue).foregroundColor(.yellow).cornerRadius(3.0)
                    })
                }//Hstack
                List{
                    ForEach(obser.textlist.indices,id:\.self){(loded) in Text(obser.textlist[loded]).onTapGesture {
                        print(loded)
                        //알림 보낼 아이템 선택
                    }
                        
         

                        
                    }.onDelete{(indexSet) in
                        self.obser.textlist.remove(atOffsets: indexSet)
                        deleteData()
                        indexingData(arr: obser.textlist)
                        print(obser.textlist)
                        
                    }
                    
                    
                } //List
                
            }.padding()
            
            //vstack
        
        
        
        
        
        
        
    } // body
}//contentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
