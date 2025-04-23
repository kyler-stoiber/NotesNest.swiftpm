import SwiftUI

struct ContentView: View {
    
    let notebooks = ["Enter Notebook", "Notebook 2", "Notebook 3"]
    @State private var currentNotebook = 0
    @State private var offset: CGFloat = 0
    @State private var direction: CGFloat = 1 // 1 for right, -1 for left
    @Namespace private var animation
    
    
    var body: some View {
        
        VStack {
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
                        Text(notebooks[currentNotebook])
                            .font(.title)
                            .foregroundColor(.black)
                    )
                    .offset(x: offset)
                    .animation(.easeInOut(duration: 0.4), value: offset)
                    .onChange(of: currentNotebook) { _ in
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
        }
    }
        // MARK: - Slide Logic
        
        func slideToNext() {
            direction = 1
            withAnimation(.easeInOut(duration: 0.4)) {
                offset = 400
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                currentNotebook = (currentNotebook + 1) % notebooks.count
            }
        }
        
        func slideToPrevious() {
            direction = -1
            withAnimation(.easeInOut(duration: 0.4)) {
                offset = -400
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                currentNotebook = (currentNotebook - 1 + notebooks.count) % notebooks.count
            }
            
        Text("Hello World")
        
        Divider()
        
        CalendarView()
        
        }
        
    }
    
    }


#Preview {
    ContentView()
}
