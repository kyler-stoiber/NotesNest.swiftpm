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
    @StateObject var folderVM = FolderViewModel()
    
    var body: some View {
        
    

    
        
            
        VStack {
            
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
                    
                    Image(systemName: "arrowshape.turn.up.backward.2.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .offset(x: -110, y: 0)
                        .foregroundColor(.white)
                    
                    
                }
                
                
                Image(systemName: "folder.badge.plus")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                    }
                    .offset(x: -30)
                
                
                Image(systemName: "folder.badge.minus")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                    }
                    .offset(x: -15)
                
                Image(systemName: "folder.badge.gearshape")
                    .resizable()
                    .frame(width: 35, height: 25)
                    .onTapGesture {
                        calendarIsShowing = false
                        
                    }
                   // .offset(calendarIsShowing, x: 30 , x: -10)
                    
            }
            
            
            
            if (calendarIsShowing == true) {
                SliderView(folderVM: folderVM)
                CalendarView()
            } else {
                AddView(folderVM: folderVM)
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
