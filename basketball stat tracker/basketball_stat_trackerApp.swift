//
//  basketball_stat_trackerApp.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/17/23.
//

import SwiftUI

@main
struct basketball_stat_trackerApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
