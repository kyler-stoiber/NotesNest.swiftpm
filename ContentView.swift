import SwiftUI

struct ContentView: View {
    
    @State var folder: [Folder] = [ ]
    @State private var currentFolder = 0
    @State private var offset: CGFloat = 0
    @State private var direction: CGFloat = 1 // 1 for right, -1 for left
    @Namespace private var animation
    @State var delete: Int?
    @State var folderName = ""
    @State var folderDate = ""
    @State var folderDesc = ""
    @State private var selectedTab = 0
    @State private var calendarIsShowing = true
    @State private var buttonOffset = 0
    var body: some View {
        
        
            
        VStack {
            
            HStack {
                
                
                
                /*
                 NavigationView{
                 NavigationLink(destination: AddView()){
                 Image(systemName: "folder.badge.plus.fill")
                 .resizable()
                 .frame(width: 35, height: 25)
                 }
                 }
                 */
                
                //remove
                
                
                    
                    /*
                     Stretch2View()
                     .tabItem {
                     Label("Stretch #2", systemImage: "02.square")
                     }
                     */
                    
                    
                
                
                
                
                /*
                 
                 Button {
                 
                 
                 } label: {
                 Image(systemName: "folder.fill.badge.plus")
                 .resizable()
                 .frame(width: 42, height: 30)
                 .offset(x: -140, y: 0)
                 }
                 
                 
                 Button {
                 delete = currentFolder
                 let max = folder.count
                 if (((delete ?? 0) <= max) && !(folder.isEmpty) && (delete ?? 0) >= 0){
                 folder.remove(at: (delete ?? 0))
                 }
                 delete = nil
                 
                 } label: {
                 Image(systemName: "folder.badge.minus.fill")
                 .resizable()
                 .frame(width: 42, height: 30)
                 .offset(x: -140, y: 0)
                 }
                 
                 */
                
                
                
                
            }
            
            /*
             HStack {
             Button(action: {
             slideToPrevious()
             }) {
             Image(systemName: "arrow.left.circle.fill")
             .resizable()
             .frame(width: 50, height: 50)
             .foregroundColor(.blue)
             }
             Spacer()
             
             // Notebook view with sliding animation
             
             RoundedRectangle(cornerRadius: 20)
             .fill(Color.white)
             .shadow(radius: 10)
             .frame(width: 200, height: 300)
             .overlay(
             Text(folder.isEmpty ? "No Folder" : folder[currentFolder].subject)
             .font(.title)
             .foregroundColor(.black)
             )
             .offset(x: offset)
             .animation(.easeInOut(duration: 0.4), value: offset)
             .onChange(of: currentFolder) { _ in
             // Reset offset after change
             offset = direction * 400
             withAnimation(.easeInOut(duration: 0.4)) {
             offset = 0
             }
             }
             
             
             Spacer()
             
             // Navigation Buttons
             
             
             Button(action: {
             slideToNext()
             }) {
             Image(systemName: "arrow.right.circle.fill")
             .resizable()
             .frame(width: 50, height: 50)
             .foregroundColor(.blue)
             }
             
             .padding(.bottom)
             }
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .background(Color.gray.opacity(0.2))
             
             */
            
            
            HStack {
                
                
                if calendarIsShowing == false {
                    
                    Image(systemName: "arrowshape.turn.up.backward.2.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .offset(x: -110, y: 0)
                        .bold()
                        .onTapGesture {
                            calendarIsShowing = true
                        }
                } else {
                    
                    
                }
                
                
                Image(systemName: "folder.badge.plus")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                    }
                    .offset(x: CGFloat((-20 + buttonOffset)))
                
                
                Image(systemName: "folder.badge.minus")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                    }
                    .offset(x: CGFloat((2 + buttonOffset)))
                
                Image(systemName: "folder.badge.gearshape")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                        buttonOffset = -30
                    }
                   // .offset(calendarIsShowing, x: 30 , x: -10)
                    
            }
            
            
            
            if (calendarIsShowing == true) {
                CalendarView()
            } else {
                AddView()
            }
        }
                
        }
        // MARK: - Slide Logic
        
        func slideToNext() {
            direction = 1
            withAnimation(.easeInOut(duration: 0.4)) {
                offset = 400
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                currentFolder = (currentFolder + 1) % folder.count
            }
        }
        
        func slideToPrevious() {
            direction = -1
            withAnimation(.easeInOut(duration: 0.4)) {
                offset = -400
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                currentFolder = (currentFolder - 1 + folder.count) % folder.count
            }
            
        
        }
        
        
        
    }
    


#Preview {
    ContentView()
}
