//
//  ContentView.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/06.
//


import SwiftUI
import RealmSwift
import UserNotifications

class observedstruct:ObservableObject {
    var arr:Array = loadData()
    @Published var textlist = [String]()
    
    @Published var data:Results<Myrealmdata> = realm.objects(Myrealmdata.self)
    //arr를 처음에 textlidst에 넣음
    init(){
        textlist = arr
    }
}
//알람 삭제 함수
var undelete = UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

struct ContentView: View {
    
    @State private var input:String = ""
    @ObservedObject var obser = observedstruct()
    @State var check:Bool = false
    @State var selectnotify = [Int]()
//    @State var select:Bool = true
    
    var body: some View {
        
            VStack{
                HStack{
                    TextField("여기에 써!", text: $input).padding(10).border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {
                        obser.textlist.append(input)
                        deleteData()
                        indexingData(arr: obser.textlist)
                        print(obser.textlist)
                        print(realm.objects(Myrealmdata.self))
                            
                        //행동을 취하면 저장소를 비우고 현재 배열로 업데이트
                    }, label: {
                        Text("확인")
                            .font(.title2)
                    }).padding(10).background(Color.blue).foregroundColor(.yellow).cornerRadius(5.0)
                }
                
                
                
                
                //Hstack
                HStack{
                    Button(action:{ authorize_Noti()}, label: {
                        Text("알림수락").padding(10).background(Color.blue).foregroundColor(.yellow).cornerRadius(5.0)
                    })//button
                    Button(action: {notifySchedule(t: makeString(arr: obser.textlist, index: selectnotify))}, label: {
                        Text("알림 설정").padding(10).background(Color.blue).foregroundColor(.yellow).cornerRadius(5.0)
                    })
                    Button(action: {
                        undelete
                    }, label: {
                        Text("알림 삭제").padding(10).background(Color.blue).foregroundColor(.yellow).cornerRadius(5.0)
                    })
                }//Hstack
                List{
                    
                    ForEach(obser.textlist.indices,id:\.self){(loded) in
                        HStack{Text(obser.textlist[loded])
                        Spacer()
                            Button(action: {print(loded)
                                    selectnotify.append(loded)
                                    print(selectnotify)}, label: {
                                Image("mainimage")
                                .resizable()
                                    .frame(width: 40, height: 40, alignment: .leading)
                                
                            })
                                
//                                .onTapGesture {
//                                    print(loded)
//                                    selectnotify.append(loded)
//                                    print(selectnotify)
//                                }//tapgesture
                            //알림 보낼 아이템 선택
                            
                    
                        }//hstack

                        
                    }.onDelete{(indexSet) in
                        self.obser.textlist.remove(atOffsets: indexSet)
                        deleteData()
                        indexingData(arr: obser.textlist)
                        print(obser.textlist)
                    }//ondelete
                    
                    
                    
                } //List
                
            }.padding().navigationBarTitle("메모",displayMode: .inline)
            
            //vstack
        
        
        
        
        
        
        
    } // body
}//contentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
