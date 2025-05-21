import SwiftUI

class FolderViewModel: ObservableObject {
    @Published var folderList: [Folder] = []
}
