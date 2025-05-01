import SwiftUI

struct CalendarView: View {
    @State private var color: Color = .blue
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundStyle(color)
                            .frame(maxWidth: .infinity)
                    }
                }

                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        if day.monthInt != date.monthInt {
                            Text("") // Empty cell for days outside current month
                        } else {
                            NavigationLink(destination: CalendarDayView(date: day)) {
                                Text(day.formatted(.dateTime.day()))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(
                                                Date.now.startOfDay == day.startOfDay
                                                ? .red.opacity(0.4)
                                                : color.opacity(0.3)
                                            )
                                    )
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                days = date.calendarDisplayDays
            }
            .onChange(of: date) { _ in
                days = date.calendarDisplayDays
            }
        }
    }
}
