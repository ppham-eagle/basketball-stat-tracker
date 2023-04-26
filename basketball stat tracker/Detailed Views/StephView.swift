//
//  StephView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/18/23.
//

import SwiftUI
import Charts

//Struct to store data for multi-bar chart
struct Compare: Identifiable {
    let id = UUID()
    let type: String
    let stat: Double
}

struct StephView: View {
    //CoreData stuff
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
    
    //Steph's career averages
    var steph_two_avg = 0.475
    var steph_three_avg = 0.428
    var steph_ft_avg = 0.909
    
    var body: some View {
        //Calculations for twos
        var total_two_makes: Int {
            Int(entries.reduce(0) {$0 + $1.two_makes})
        }
        var total_two_misses: Int {
            Int(entries.reduce(0) {$0 + $1.two_misses})
        }
        let total_twos = total_two_makes + total_two_misses
        //Calculations for threes
        var total_three_makes: Int {
            Int(entries.reduce(0) {$0 + $1.three_makes})
        }
        var total_three_misses: Int {
            Int(entries.reduce(0) {$0 + $1.three_misses})
        }
        let total_threes = total_three_makes + total_three_misses
        //Calculations for FTs
        var total_ft_makes: Int {
            Int(entries.reduce(0) {$0 + $1.ft_makes})
        }
        var total_ft_misses: Int {
            Int(entries.reduce(0) {$0 + $1.ft_misses})
        }
        let total_fts = total_ft_makes + total_ft_misses
        //Total percentages for 2s and 3s
        let you_two_pct: Double = Double(total_two_makes) / Double(total_twos)
        let you_three_pct: Double = Double(total_three_makes) / Double(total_threes)
        //Total percentage for fts
        let you_ft_pct: Double = Double(total_ft_makes) / Double(total_fts)
        //Array of Compare objects of your stats
        let youStats: [Compare] = [
            .init(type:"2PT%", stat: you_two_pct),
            .init(type:"3PT%", stat: you_three_pct),
            .init(type:"FT%", stat: you_ft_pct)
        ]
        //Array of Compare objects of Steph's stats
        let stephStats: [Compare] = [
            .init(type:"2PT%", stat: steph_two_avg ),
            .init(type:"3PT%", stat: steph_three_avg ),
            .init(type:"FT%", stat: steph_ft_avg)
        ]
        //Array of stats arrays with labels
        let compareData = [
            (player: "You", data: youStats),
            (player: "Steph Curry (Career AVG)", data: stephStats)
        ]
        
        VStack {
            Text("The Final Boss")
                .padding()
                .font(.title2)
            //Put the appropriate values to the x and y axises to get horizontal bars
            //.foregroundStyle and .position enable the seperate bars otherwise the data would just stack onto a single bar
            Chart {
                //Iterate through each stat array with label, then iterate through the data of an individual stat array
                ForEach(compareData, id: \.player) { element in ForEach(element.data) { data in
                    BarMark(x: .value("Percentages", data.stat), y: .value("Type", data.type))
                        .annotation(position: .overlay, alignment: .trailing) {
                            Text("\(data.stat, specifier: "%.3f")").fontWeight(.bold)
                        }
                    }
                    .foregroundStyle(by: .value("Player", element.player))
                    .position(by: .value("Player", element.player))
                }
            }
        }
        .padding(EdgeInsets(top:0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct StephView_Previews: PreviewProvider {
    static var previews: some View {
        StephView()
    }
}
