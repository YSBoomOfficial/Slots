//
//  ContentView.swift
//  Slots
//
//  Created by Yash on 16/08/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
	private var betamt = 5
	
    var body: some View {
        VStack {
            ZStack {
				//background
				Group {
					Rectangle()
						.foregroundColor(Color(red: 32/255, green: 32/255, blue: 32/255))
						.edgesIgnoringSafeArea(.all)
					Rectangle()
						.foregroundColor(Color(red: 64/255, green: 64/255, blue: 64/255))
						.rotationEffect(Angle(degrees: 45))
						.edgesIgnoringSafeArea(.all)
				}
                
                VStack {
					//Title
                    HStack {
                        Spacer()
                        ZStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .scaleEffect(2.5)
                            Image(systemName: "star.fill").foregroundColor(.white)
                                .scaleEffect(2)
                        }
                        Text("Slots")
                            .foregroundColor(.white)
                            .fontWeight(.black)
                            .font(.largeTitle)
                            .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        ZStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .scaleEffect(2.5)
                            Image(systemName: "star.fill").foregroundColor(.white)
                                .scaleEffect(2)
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    //Credits Counter
                    Text("Credits: \(self.credits)")
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    // cards
                    VStack {
                        HStack {
                            Spacer()
                            CardView(Symbol: $symbols[numbers[0]], background: $backgrounds[0])
                            CardView(Symbol: $symbols[numbers[1]], background: $backgrounds[1])
                            CardView(Symbol: $symbols[numbers[2]], background: $backgrounds[2])
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            CardView(Symbol: $symbols[numbers[3]], background: $backgrounds[3])
                            CardView(Symbol: $symbols[numbers[4]], background: $backgrounds[4])
                            CardView(Symbol: $symbols[numbers[5]], background: $backgrounds[5])
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            CardView(Symbol: $symbols[numbers[6]], background: $backgrounds[6])
                            CardView(Symbol: $symbols[numbers[7]], background: $backgrounds[7])
                            CardView(Symbol: $symbols[numbers[8]], background: $backgrounds[8])
                            Spacer()
                        }
                        
                    }
                    
                    Spacer()
                    Spacer()
                    
                    //Spin Button
                    HStack {
						// spin mid
                        VStack {
                            Button(action: {
                                // process single win
                                self.processResults()
                                
                            }) {
                                Text("Spin middle")
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                            }
                            Text("\(betamt) Credits")
                                .padding(.top, 5)
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
						// spin all
                        VStack {
                            Button(action: {
                                // process single win
                                self.processResults(true)
                                
                            }) {
                                Text("Spin All")
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 40)
                                    .background(Color.purple)
                                    .cornerRadius(20)
                            }
							
                            Text("\(betamt*5) Credits")
                                .padding(.top, 5)
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    func processResults(_ isMax: Bool = false) {
        // update bg white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        
        if isMax {
            // spin all
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.symbols.count - 1)
            })
        }
        else {
            // spin only mid
            self.numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        
        //check winnings
        processWin(isMax)
    }
    
    func processWin(_ isMax: Bool = false) {
        var matches = 0
        
        if !isMax {
            // single spin
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] {
                // Won
                matches += 1
                // update bg green
                self.backgrounds[3] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[5] = Color.green
            }
        } else {
            // max spin
            
            //rows
            // top row
            if isMatch(0, 1, 2) { matches += 1 }
            // middle row
            if isMatch(3, 4, 5) { matches += 1 }
            // bottom row
            if isMatch(6, 7, 8) { matches += 1 }
            
            // collum
            // left collum
            if isMatch(0, 3, 6) { matches += 1 }
            // middle
            if isMatch(1, 4, 7) { matches += 1 }
            // right side
            if isMatch(2, 5, 8) { matches += 1 }

            //dioganal
            // bottom left to top right
            if isMatch(2, 4, 6) { matches += 1 }
            // right side
            if isMatch(0, 4, 8) { matches += 1 }

        }
        if matches > 0 {
            // at leat 1 win
            self.credits += betamt * matches * 2
        }
        else if !isMax {
            // 0 win, single spin
            self.credits -= betamt
        }
        else {
            // 0 win, max spin
            self.credits -= betamt * 5
        }
    }
    
    func isMatch(_ index1:Int,_ index2:Int,_ index3:Int) -> Bool {
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            // update bg green
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            return true
        }
        return false
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
