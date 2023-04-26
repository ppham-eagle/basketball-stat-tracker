//
//  ShaqView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/25/23.
//

import SwiftUI

struct ShaqView: View {
    //CoreData stuff
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
    //NBA averages for 2022-23 season
    var nba_two_avg = 0.475
    var nba_three_avg = 0.361
    var nba_ft_avg = 0.782
    
    var body: some View {
        //Calculations for twos
        var total_two_makes: Int {
            Int(entries.reduce(0) {$0 + $1.two_makes})
        }
        var total_two_misses: Int {
            Int(entries.reduce(0) {$0 + $1.two_misses})
        }
        //Calculations for threes
        var total_three_makes: Int {
            Int(entries.reduce(0) {$0 + $1.three_makes})
        }
        var total_three_misses: Int {
            Int(entries.reduce(0) {$0 + $1.three_misses})
        }
        //Calculations for FTs
        var total_ft_makes: Int {
            Int(entries.reduce(0) {$0 + $1.ft_makes})
        }
        var total_ft_misses: Int {
            Int(entries.reduce(0) {$0 + $1.ft_misses})
        }
        let total_fts = total_ft_makes + total_ft_misses
        //Total percentage for fts
        let you_ft_pct: Double = Double(total_ft_makes) / Double(total_fts)
        
        VStack {
            Text("Free Throw Analysis")
                .padding()
                .font(.title2)
            //Show a picture of Shaq if your ft percentage is below nba avg
            if(you_ft_pct < nba_ft_avg) {
                Image("shaq-ft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            //Show a picture of Curry if your ft percentage is above nba avg
            else {
                Image("steph-ft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text("If you are below the NBA average for free throws, you will see a picture of Shaq. Otherwise, a picture of Steph Curry will appear.")
                .padding()
            //FT comparison
            VStack {
                Text("Your FT%: ")
                //Text("1.00").fontWeight(.bold)
                Text("\(you_ft_pct, specifier: "%.3f")").fontWeight(.bold)
                Text("NBA AVG FT% (2022-23): ")
                Text("\(nba_ft_avg, specifier: "%.3f")")
                    .fontWeight(.bold)
            }
            .padding(4)
            .border(.purple)
            Spacer()
        }
        //.padding(EdgeInsets(top:-20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ShaqView_Previews: PreviewProvider {
    static var previews: some View {
        ShaqView()
    }
}
