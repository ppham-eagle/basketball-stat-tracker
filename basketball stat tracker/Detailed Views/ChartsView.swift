//
//  ChartsView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/18/23.
//

import SwiftUI
import Charts

struct ChartsView: View {
    //CoreData stuff
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \InputEntity.date, ascending: true)]) var entries: FetchedResults<InputEntity>
            
    var body: some View {
        ScrollView {
            Text("Shot Analysis")
                .padding()
                .font(.title2)
            //Charts for total shots
            VStack {
                Text("Total shot stats:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Spacer()
                Text("Total shots taken per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("All Shots", entry.two_makes+entry.two_misses+entry.three_makes+entry.three_misses+entry.ft_makes+entry.ft_misses)
                    )
                }
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.black)
            //Charts for 2 pointers
            VStack {
                Text("2-pointer stats:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Spacer()
                Text("Total 2-pointers made per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("2 Makes", entry.two_makes)
                    )
                    .foregroundStyle(.green)
                }
                Text("Total 2-pointers missed per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("2 Misses", entry.two_misses)
                    )
                    .foregroundStyle(.red)
                }
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.black)
            //Charts for 3 pointers
            VStack {
                Text("3-pointer stats:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Spacer()
                Text("Total 3-pointers made per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("3 Makes", entry.three_makes)
                    )
                    .foregroundStyle(.green)
                }
                Text("Total 3-pointers missed per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("3 Misses", entry.three_misses)
                    )
                    .foregroundStyle(.red)
                }
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.black)
            //Charts for free throws
            VStack {
                Text("Free throw stats:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Spacer()
                Text("Total free throws made per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("FT Makes", entry.ft_makes)
                    )
                    .foregroundStyle(.green)
                }
                Text("Total free throws missed per month")
                Chart(entries){entry in
                    BarMark(
                        x: .value("Month+Year", entry.month!+" "+entry.year!),
                        y: .value("FT Misses", entry.ft_misses)
                    )
                    .foregroundStyle(.red)
                }
            }
            Divider()
                .frame(minHeight: 2)
                .overlay(Color.black)
        }
        .padding(EdgeInsets(top:0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
