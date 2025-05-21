import SwiftUI

struct SliderView: View {
    @ObservedObject var folderVM: FolderViewModel

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(folderVM.folderList) { folder in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(folder.color)
                                .frame(width: 100, height: 150)
                                .shadow(radius: 5)

                            VStack(alignment: .leading) {
                                Text(folder.subject)
                                    .font(.headline)
                                    .foregroundColor(.white)

                                Text(folder.desc)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("My Folders")
        }
    }
}
