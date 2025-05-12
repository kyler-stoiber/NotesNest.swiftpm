import Foundation

class CalendarDayViewModel: ObservableObject {
    @Published var assignmentList: [String] = []
    private let dateKey: String

    init(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.dateKey = "assignments-\(formatter.string(from: date))"
        loadAssignments()
    }

    func addAssignment(_ name: String) {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        assignmentList.append(trimmed)
        saveAssignments()
    }
    
    func removeAssignment(_ index: Int) {
        assignmentList.remove(at: index)
        saveAssignments()
    }

    private func saveAssignments() {
        if let data = try? JSONEncoder().encode(assignmentList) {
            UserDefaults.standard.set(data, forKey: dateKey)
        }
    }

    private func loadAssignments() {
        if let data = UserDefaults.standard.data(forKey: dateKey),
           let saved = try? JSONDecoder().decode([String].self, from: data) {
            assignmentList = saved
        }
    }
}
