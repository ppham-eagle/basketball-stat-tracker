//
//  SettingsView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/26/23.
//

import SwiftUI

struct SettingsView: View {
    //CoreData Stuff
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title2)
                //.padding(.top, -6)
            List {
                //Button that will show an alert to give user the option to delete all data
                Button("Delete all data") {
                    showingAlert = true
                }
                .alert(isPresented:$showingAlert) {
                    Alert(title: Text("Are you sure you want to delete all the data?"), message: Text("Can't undo."), primaryButton: .destructive(Text("Delete")) {
                        deleteAll()
                    }, secondaryButton: .cancel()
                    )
                }
            }
        }
    }
    //Function to clear all data from CoreData
    func deleteAll() {
            let fetchRequest = InputEntity.fetchRequest()
            let items = try? moc.fetch(fetchRequest)
            for item in items ?? [] {
                moc.delete(item)
            }
            try? moc.save()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
