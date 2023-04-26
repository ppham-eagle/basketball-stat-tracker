//
//  InputView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/18/23.
//

import SwiftUI

struct InputView: View {
    
    @State var date = Date()
    @State var month: String = ""
    @State var year: String = ""
    @State var two_makes: Int?
    @State var two_misses: Int?
    @State var three_makes: Int?
    @State var three_misses: Int?
    @State var ft_makes: Int?
    @State var ft_misses: Int?
    
    //CoreData stuff
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
    
    var body: some View {
        ScrollView {
            Text("Input a shooting session")
                .padding()
                .font(.title2)
            //Date input
            Text("Day of session:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            DatePicker("Select a date:", selection: $date, displayedComponents: .date)
            //2 Pointer input
            VStack {
                Text("2-Point shots:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("Makes:")
                TextField("", value: $two_makes, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.green)
                    .keyboardType(.numberPad)
                Text("Misses:")
                TextField("", value: $two_misses, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.red)
                    .keyboardType(.numberPad)
            }
            //3 Pointer input
            VStack {
                Text("3-Point shots:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("Makes:")
                TextField("", value: $three_makes, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.green)
                    .keyboardType(.numberPad)
                Text("Misses:")
                TextField("", value: $three_misses, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.red)
                    .keyboardType(.numberPad)
            }
            //Free throw input
            VStack {
                Text("Free throws:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("Makes:")
                TextField("", value: $ft_makes, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.green)
                    .keyboardType(.numberPad)
                Text("Misses:")
                TextField("", value: $ft_misses, format: .number)
                    .frame(width: 200, height: 40)
                    .font(.system(size:25))
                    .multilineTextAlignment(.center)
                    .background(Color.red)
                    .keyboardType(.numberPad)
            }
            //Save input to CoreData with this button
            Button("Save entry") {
                month = date.formatted(.dateTime.month(.wide))
                year = date.formatted(.dateTime.year())
                addEntry()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        //to close software keyboard on tap
        .onTapGesture {
            endEditing()
        }
    }
    //function to add input to CoreData
    func addEntry() {
        let entry = InputEntity(context: moc)
        
        entry.date = date
        entry.month = month
        entry.year = year
        //if an input is nil, set data to 0
        if(two_makes != nil) {
            entry.two_makes = Int16(two_makes!)
        }
        else {
            entry.two_makes = 0
        }
        if(two_misses != nil) {
            entry.two_misses = Int16(two_misses!)
        }
        else {
            entry.two_misses = 0
        }
        if(three_makes != nil) {
            entry.three_makes = Int16(three_makes!)
        }
        else {
            entry.three_makes = 0
        }
        if(three_misses != nil) {
            entry.three_misses = Int16(three_misses!)
        }
        else {
            entry.three_misses = 0
        }
        if(ft_makes != nil) {
            entry.ft_makes = Int16(ft_makes!)
        }
        else {
            entry.ft_makes = 0
        }
        if(ft_misses != nil) {
            entry.ft_misses = Int16(ft_misses!)
        }
        else {
            entry.ft_misses = 0
        }
        //save input
        saveEntry()
    }
    //function to save input to CoreData
    func saveEntry() {
        do {
            try moc.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
}
//function to close software keyboard
func endEditing() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
