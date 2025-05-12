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
    //@State var folderDate = ""
    @State var folderColor: Color = .blue

        
    var body: some View {
        
        NavigationStack {
            
            VStack{
                
                Text("Enter Folder Details")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .frame(width: 400, height: 100)
                    .background(.blue)
                    .opacity(0.7)
                
                VStack {
                    
                    HStack {
                        
                        TextField("Subject:", text: $folderSubject)
                            .padding(.leading, 10)
                            .frame(width: 300, height: 50)
                            .background(Color.green.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(x: -10, y: 0)
                        
                        
                        Button {
                            folderSubject = ""
                        } label: {
                            Image(systemName: "pencil.and.ellipsis.rectangle")
                                .resizable()
                                .frame(width: 40, height: 30)
                                .offset(x: 5, y: -5)
                        }
                        
                        
                        
                    }
                    
                    HStack {
                        
                        TextField("Description:", text: $folderDesc)
                            .padding(.leading, 10)
                            .frame(width: 300, height: 50)
                            .background(Color.green.opacity(0.7))
                            .multilineTextAlignment(.leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(x: -11, y: 0)
                        
                        
                        Button {
                            folderDesc = ""
                        } label: {
                            Image(systemName: "pencil.and.list.clipboard")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .offset(x: 5, y: 0)
                        }
                        
                        
                        
                    }
                    
                    /*
                     
                     TextField("Due Date:", text: $folderDate)
                     .frame(width: 120, height: 50)
                     .background(Color.green.opacity(0.7))
                     .multilineTextAlignment(.center)
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     
                     */
                    
                    
                }
                
                
                Spacer()
                
                Text("Choose Folder Color:")
                    .frame(width: 500, height: 40)
                    .background(Color.green.opacity(0.7))
                    .bold()
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                    .padding(5)
                
                
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
            
            Spacer()
            
            Text("Folder Preview:")
            
            ZStack {
                
                var textColor: Color = (folderColor == .black || folderColor == .indigo || folderColor == .blue) ? .white : .black
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(folderColor)
                    .shadow(radius: 10)
                    .frame(width: 200, height: 300)
                
                Text("\(folderSubject)")
                    .foregroundColor(textColor)
                    .font(.system(size: 20))
                    .bold()
                    .frame(width: 180, height: 80, alignment: .topLeading)
                    .padding(.leading, 10)
                    .multilineTextAlignment(.leading)
                    .offset(x: 0, y: -95)
                
                Text("\(folderDesc)")
                    .foregroundColor(textColor)
                    .font(.system(size: 20))
                    .padding(.leading, 10)
                    .frame(width: 190, height: 140, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .offset(x: 0, y: 60)
                
                
            }
            
            Button {
                let newFolder = Folder(color: folderColor,  desc: folderDesc, subject: folderSubject)
                folderList.append(newFolder)
                folderColor = .blue
                folderDesc = ""
                folderSubject = ""
            } label: {
                Text("Add Folder")
                    .frame(height: 40)
                Image(systemName: "plus.circle")
            }
            
            /*
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
             
             */
        }
    }
}




#Preview {
    AddView()
}


