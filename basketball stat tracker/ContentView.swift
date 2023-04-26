//
//  ContentView.swift
//  basketball stat tracker
//
//  Created by user236826 on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hesi Pull-up Jimbo Tracker")
                    .font(.title)
                /*
                Image("practice")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                */
                Text("Input and analyze your shooting stats")
            }
            List {
                //Data Section
                Section {
                    //Input data here
                    HStack {
                        Image(systemName: "pencil")
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 34))
                        NavigationLink {
                            InputView()
                        } label: {
                            Text(" Input shots")
                                .font(.system(size: 20))
                        }
                        .padding(25)
                    }
                } header: {
                    Text("Data")
                }
                //Analysis Section
                Section {
                    //Progession bar charts
                    HStack {
                        Image(systemName: "chart.dots.scatter")
                            .foregroundColor(Color(.systemOrange))
                            .font(.system(size: 30))
                        NavigationStack {
                            NavigationLink {
                                ChartsView()
                            } label: {
                                Text("10,000 Hours")
                                    .font(.system(size: 20))
                            }
                        }
                        .padding(25)
                    }
                    //Field goal shot chart
                    HStack {
                        Image("shot-location")
                            .resizable()
                            .frame(width: 40, height:40)
                        NavigationStack {
                            NavigationLink {
                                ZonesView()
                            } label: {
                                Text("NBA Ready?")
                                    .font(.system(size: 20))
                            }
                        }
                        .padding(25)
                    }
                    //Free throws
                    HStack {
                        Image("shaq")
                            .resizable()
                            .frame(width: 40, height:40)
                        NavigationStack {
                            NavigationLink {
                                ShaqView()
                            } label: {
                                Text("Shaq or Steph?")
                                    .font(.system(size: 20))
                            }
                        }
                        .padding(25)
                    }
                    //Compare to Curry
                    HStack {
                        Image("steph")
                            .resizable()
                            .frame(width: 40, height:40)
                        NavigationStack {
                            NavigationLink {
                                StephView()
                            } label: {
                                Text("You vs. Steph")
                            }
                            .font(.system(size: 20))
                        }
                        .padding(25)
                    }
                }
                header : {
                    Text("Analysis")
                }
                //Settings Section
                Section {
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 40, height:40)
                        NavigationStack {
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Text("General")
                            }
                            .font(.system(size: 20))
                        }
                        .padding(25)
                    }
                }
                header: {
                    Text("Settings")
                }
            }
            //.padding(.top,-8)
        }
        //.padding(.top,-70)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
