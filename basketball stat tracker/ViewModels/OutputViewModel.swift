//
//  OutputViewModel.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/23/23.
//

import Foundation
import SwiftUI

class OutputViewModel: ObservableObject {
    @Published var outputs: [Output] = []
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
    
    /*
    func load_months() {
        ForEach(entries) {entry in
            /*
            ForEach(outputs) {output in
                if(entry.month == output.month && entry.year == output.month) {
                    output.date = entry.date
                    output.month = entry.month
                    output.year = entry.year
                    output.two_makes += entry.two_makes
                    output.two_misses += entry.two_misses
                    output.three_makes += entry.three_makes
                    output.three_misses += entry.three_misses
                    output.ft_makes += entry.ft_makes
                    output.ft_misses += entry.ft_misses
                }
            }
            */
            /*
            var new = Output(date: entry.date!, month: entry.month!, year: entry.year!, two_makes: Int(entry.two_makes!), two_misses: Int(entry.two_misses!), three_makes: Int(entry.three_makes!), three_misses: Int(entry.three_misses!), ft_makes: Int(entry.ft_makes!), ft_misses: Int(entry.ft_misses!))
            new.date = entry.date
            new.month = entry.month
            new.year = entry.year
            new.two_makes = entry.two_makes
            new.two_misses = entry.two_misses
            new.three_makes = entry.three_makes
            new.three_misses = entry.three_misses
            new.ft_makes = entry.ft_makes
            new.ft_misses = entry.ft_misses
            outputs.append(new)
            */
            var test = entry.year!
            Text(test)
        }
    }
    */
}
