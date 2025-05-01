import SwiftUI

struct CalendarDayView: View {
    let date: Date

    var body: some View {
        VStack {
            Text("Calendar Day View")
                .font(.largeTitle)
                .padding()

            Text("Selected date: \(date.formatted(date: .long, time: .omitted))")
                .font(.title2)
                .padding()
        }
        .navigationTitle(date.formatted(.dateTime.day().month().year()))
        .navigationBarTitleDisplayMode(.inline)
    }
}
