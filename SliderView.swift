//
//  SliderView.swift
//  NotesNest
//
//  Created by Rokicki, Thomas (512515) on 5/1/25.
//

import SwiftUI


struct SliderView: View {
    
    //@Binding var folderSubject: String
    let images = ["photo1", "photo2", "photo3"]
    //@Binding var folderList: [ Folder]
    
    var body: some View {
            
        HStack{
            
            TabView {
                ForEach(images, id: \.self) { image in
                    Button{
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 200, height: 300)
                            .overlay(Text(""))
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 350)
           
        }
    }
}
    



#Preview {
    SliderView()
}
