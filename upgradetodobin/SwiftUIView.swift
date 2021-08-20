//
//  SwiftUIView.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/12.
//

import SwiftUI
import WebKit


struct SwiftUIView: View {

    @State var check: CGFloat = 1
    
    
    var body: some View {
        NavigationView{
            VStack{
                Image("mainimage").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250, alignment: .top).offset(x: 20, y: -117).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.offset(x: 20, y: -100)).overlay(Circle().offset(x: 2, y: -100).stroke(Color.white, lineWidth: 4).shadow(radius: 10))
                VStack(spacing:10){
            NavigationLink(
                destination: ContentView(),
                label: {
                    Text("메모 확인\n 하러 가기").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).frame(width: 200.0 , height: 100.0) .background(RoundedRectangle(cornerRadius: 15.0).fill(Color.purple)).shadow(radius: 30)//button
                })//NavigationLink
               NavigationLink(
                destination: MyWebView(urlToload: "www.opic.or.kr"),
                label: {
                    Text("오픽 확인").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).frame(width: 300.0 , height: 50.0) .background(RoundedRectangle(cornerRadius: 15.0).fill(Color.purple)).shadow(radius: 20)
                })//navilink
                }//Vstack
                
            }//Vstack
        }.background(Color.white)//NavigationView
        
    }//body
}//view




struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
