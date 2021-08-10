//
//  ContentView.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/06.
//

import SwiftUI
import RealmSwift

class observedstruct:ObservableObject {
    var arr:Array = loadData()
    @Published var textlist = [String]()
    //arr를 처음에 textlidst에 넣어야 함
    @Published var data:Results<Myrealmdata> = realm.objects(Myrealmdata.self)
    init(){
        textlist = arr
    }
}

struct togleNotify{
    @State var notify: Bool = false
}


struct ContentView: View {
    
    @State private var input:String = ""
    @ObservedObject var obser = observedstruct()
    
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
                    
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                }).padding(10).cornerRadius(3.0).background(Color.blue).foregroundColor(.yellow)
            }//Hstack
            HStack{
                Button(action:{ authorize_Noti()}, label: {
                    Text("알림수락").background(Color.blue).foregroundColor(.yellow).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                })//button
                Button(action: {notifySchedule(t: obser.textlist[0])}, label: {
                    Text("알림 설정").background(Color.blue).foregroundColor(.yellow).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                })
                Button(action: {
                    
                }, label: {
                    Text("삭제").background(Color.blue).foregroundColor(.yellow).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                })
            }//Hstack
            List{
                ForEach(obser.textlist ,id:\.self){(loded) in Text(loded)
                  
                }.onDelete{(indexSet) in
                    self.obser.textlist.remove(atOffsets: indexSet)
                    deleteData()
                    indexingData(arr: obser.textlist)
                    print(obser.textlist)
                }
            } //List
            
        }//vstack
    } // body
}//contentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
