//
//  ContentView.swift
//  Assignment Notebook Stoiber
//
//  Created by Stoiber, Kyler (512144) on 1/27/25.
//

import SwiftUI

struct AddView: View {
    
    @State var folderList: [Folder] = []
    
    @State var folderDesc = ""
    @State var folderSubject = ""
    @State var folderDate = ""
    @State var folderColor: Color = .blue

        
    var body: some View {
        VStack{
            
            Text("Enter Folder Details")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(width: 400, height: 100)
                .background(.blue)
                .opacity(0.7)
            
            HStack {
                
                TextField("Subject:", text: $folderSubject)
                    .frame(width: 120, height: 50)
                    .background(Color.green.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                TextField("Description:", text: $folderDesc)
                    .frame(width: 120, height: 50)
                    .background(Color.green.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))


                TextField("Due Date:", text: $folderDate)
                    .frame(width: 120, height: 50)
                    .background(Color.green.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
            }
            
            
            Spacer()
            
            Text("Choose Folder Color:")
                .frame(width: 120, height: 50)
                .background(Color.green.opacity(0.7))
                .multilineTextAlignment(.center)
                .opacity(0.8)
                
                
            Spacer()
            
            HStack {
                
                Button {
                    folderColor = .red
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.red)

                }
                .padding(10)
                                
                Button {
                    folderColor = .orange
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.orange)

                }
                .padding(10)
                                
                Button {
                    folderColor = .yellow
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.yellow)
                }
                .padding(10)
                                
                Button {
                    folderColor = .green
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.green)
                }
                .padding(10)
                                
                Button {
                    folderColor = .blue
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.blue)
                }
                .padding(10)
                
            }
            
            HStack {
                
                Button {
                    folderColor = .indigo
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.indigo)

                }
                .padding(10)
                                
                Button {
                    folderColor = .cyan
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.cyan)
                    
                }
                .padding(10)
                                
                Button {
                    folderColor = .gray
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.gray)
                }
                .padding(10)
                                
                Button {
                    folderColor = .brown
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.brown)
                }
                .padding(10)
                                
                Button {
                    folderColor = .black
                } label: {
                    Image(systemName: "folder.fill")
                        .resizable()
                        .frame(width: 49, height: 35)
                        .foregroundColor(.black)
                }
                .padding(10)
                
            }
            
            Spacer()
            
        }
        
        Button {
            let newFolder = Folder(date: folderDate,  desc: folderDesc, subject: folderSubject)
            
            folderList.append(newFolder)
            folderDate = ""
            folderDesc = ""
            folderSubject = ""
        } label: {
            Text("Add Folder")
                .frame(height: 40)
            Image(systemName: "plus.circle")
        }
    
        
        Spacer()
        
        
        NavigationView {
            List {
                ForEach(folderList, id: \.self) {
                    newFolder in
                    NavigationLink("\(newFolder.subject)") {
                        DetailedView(selectedFolder: newFolder)
                    }
                }
            }
        }
    }
}




#Preview {
    AddView()
}


