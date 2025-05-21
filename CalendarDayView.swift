import SwiftUI

struct CalendarDayView: View {
    let date: Date
    @StateObject private var viewModel: CalendarDayViewModel
    @State private var assignmentName = ""
    @State private var deleteIndex = ""
    @State private var nilBool = false
    

    init(date: Date) {
        self.date = date
        _viewModel = StateObject(wrappedValue: CalendarDayViewModel(date: date))
    }

    var body: some View {
        VStack {
            Text(date.formatted(date: .long, time: .omitted))
                .font(.largeTitle)
                .padding()

            HStack {
                TextField("Assignment Name:", text: $assignmentName)
                    .padding(.leading, 10)
                    .frame(width: 300, height: 50)
                    .background(Color.green.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onSubmit {
                        viewModel.addAssignment(assignmentName)
                        assignmentName = ""
                        
                    }

                Button {
                    assignmentName = ""
                } label: {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                        .resizable()
                        .frame(width: 40, height: 30)
                }
            }
            
            HStack {
                TextField("Delete At:", text: $deleteIndex)
                    .padding(.leading, 10)
                    .frame(width: 100, height: 50)
                    .background(Color.red.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: -9, y: 0)
                    .onSubmit {
                        deleteIndex = ""
                    }

                Button {
                    if let index = Int(deleteIndex), index >= 0, index < viewModel.assignmentList.count {
                        viewModel.removeAssignment(index)
                        if (index == 0){
                            nilBool = true
                                         }
                    }
                    deleteIndex = ""
                    
                    if (nilBool == false) {
                        viewModel.removeAssignment(0)

                    }
                } label: {
                    Image(systemName: "minus.square")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.leading, 197)
                }
            }


            List {
                ForEach(viewModel.assignmentList, id: \.self) { assignment in
                    Text(assignment)
                }
            }

        }
        .navigationTitle(date.formatted(.dateTime.day().month().year()))
        .navigationBarTitleDisplayMode(.inline)
    }
}
