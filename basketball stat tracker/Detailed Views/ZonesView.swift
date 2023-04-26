//
//  ZonesView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/18/23.
//

import SwiftUI

struct ZonesView: View {
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
        //Total percentages for 2s and 3s
        let you_two_pct: Double = Double(total_two_makes) / Double(total_twos)
        let you_three_pct: Double = Double(total_three_makes) / Double(total_threes)
    
        ScrollView {
            VStack {
                Text("Shot Chart")
                    .padding()
                    .font(.title2)
                //Court diagram
                ZStack {
                    //red 2, green 3
                    if(you_two_pct < nba_two_avg && you_three_pct > nba_three_avg) {
                        //3 point area
                        Rectangle()
                            .fill(.green)
                        //.stroke(Color.black)
                            .border(Color.black)
                            .frame(width:350, height: 280)
                        //2 point area
                        RoundedRectangle(cornerSize: CGSize(width: 80, height: 140), style: .continuous)
                            .fill(.red)
                        //.stroke(Color.black)
                            .frame(width: 280, height: 300)
                            .offset(x: -80)
                            .clipped()
                            .rotationEffect(.degrees(90))
                    }
                    //red 2, red 3
                    if(you_two_pct < nba_two_avg && you_three_pct < nba_three_avg) {
                        //3 point area
                        Rectangle()
                            .fill(.red)
                        //.stroke(Color.black)
                            .border(Color.black)
                            .frame(width:350, height: 280)
                        //2 point area
                        RoundedRectangle(cornerSize: CGSize(width: 80, height: 140), style: .continuous)
                        //.fill(.red)
                            .stroke(Color.black)
                            .frame(width: 280, height: 300)
                            .offset(x: -80)
                            .clipped()
                            .rotationEffect(.degrees(90))
                    }
                    //green 2, red 3
                    if(you_two_pct > nba_two_avg && you_three_pct < nba_three_avg) {
                        //3 point area
                        Rectangle()
                            .fill(.red)
                        //.stroke(Color.black)
                            .border(Color.black)
                            .frame(width:350, height: 280)
                        //2 point area
                        RoundedRectangle(cornerSize: CGSize(width: 80, height: 140), style: .continuous)
                            .fill(.green)
                        //.stroke(Color.black)
                            .frame(width: 280, height: 300)
                            .offset(x: -80)
                            .clipped()
                            .rotationEffect(.degrees(90))
                    }
                    //green 2, green 3
                    if(you_two_pct > nba_two_avg && you_three_pct > nba_three_avg) {
                        //3 point area
                        Rectangle()
                            .fill(.green)
                        //.stroke(Color.black)
                            .border(Color.black)
                            .frame(width:350, height: 280)
                        //2 point area
                        RoundedRectangle(cornerSize: CGSize(width: 80, height: 140), style: .continuous)
                        //.fill(.green)
                            .stroke(Color.black)
                            .frame(width: 280, height: 300)
                            .offset(x: -80)
                            .clipped()
                            .rotationEffect(.degrees(90))
                    }
                    
                    //paint
                    Rectangle()
                        .stroke(Color.black)
                        .frame(width:100, height: 120)
                        .offset(y:-78)
                    //ft line half circle
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.black)
                        .frame(width:100, height: 120)
                        .offset(y:-26)
                    //hoop
                    Circle()
                        .stroke(Color.black)
                        .frame(width:20, height: 20)
                        .offset(y:-124)
                    //backboard
                    Rectangle()
                        .stroke(Color.black)
                        .frame(width:2, height: 35)
                        .rotationEffect(.degrees(90))
                        .offset(y:-135)
                }
                Text("A shooting zone will be green if your shooting percentage in a zone is greater than the NBA average. Red if not.")
                    .padding()
                //2 point stats comparison
                VStack {
                    Text("Your 2-Point FG%: ")
                    //Text("1.00").fontWeight(.bold)
                    Text("\(you_two_pct, specifier: "%.3f")").fontWeight(.bold)
                    Text("NBA 2-Point AVG FG% (2022-23): ")
                    Text("\(nba_two_avg, specifier: "%.3f")")
                        .fontWeight(.bold)
                }
                .padding(4)
                .border(.orange)
                .padding()
                //3 point stats comparison
                VStack{
                    Text("Your 3-Point FG%: ")
                    //Text("1.00").fontWeight(.bold)
                    Text("\(you_three_pct, specifier: "%.3f")").fontWeight(.bold)
                    Text("NBA 3-Point AVG FG% (2022-23): ")
                    Text("\(nba_three_avg, specifier: "%.3f")")
                        .fontWeight(.bold)
                }
                .padding(4)
                .border(.blue)
                Spacer()
            }
        }
        //.padding(EdgeInsets(top:-20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ZonesView_Previews: PreviewProvider {
    static var previews: some View {
        ZonesView()
    }
}
