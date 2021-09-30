//
//  ViewModel.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//

import SwiftUI

enum const {
	static let betamt = 5
}

class ViewModel: ObservableObject {
	@Published var symbols = ["apple", "star", "cherry"]
	@Published var numbers = Array(repeating: 0, count: 9)
	@Published var credits = 1000
	@Published var backgrounds = Array(repeating: Color.white, count: 9)
	
	func processResults(_ isMax: Bool = false) {
		// update bg white
		backgrounds = backgrounds.map { _ in
			Color.white
		}
		
		if isMax {
			// spin all
			numbers = numbers.map({ _ in
				Int.random(in: 0...symbols.count - 1)
			})
		} else {
			// spin only mid
			numbers[3] = Int.random(in: 0...symbols.count - 1)
			numbers[4] = Int.random(in: 0...symbols.count - 1)
			numbers[5] = Int.random(in: 0...symbols.count - 1)
		}
		
		//check winnings
		processWin(isMax)
	}
	
	func processWin(_ isMax: Bool = false) {
		var matches = 0
		
		if !isMax {
			// single spin
			if numbers[3] == numbers[4] && numbers[4] == numbers[5] {
				// Won
				matches += 1
				// update bg green
				backgrounds[3] = Color.green
				backgrounds[4] = Color.green
				backgrounds[5] = Color.green
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
			credits += const.betamt * matches * 2
		} else if !isMax {
			// 0 win, single spin
			credits -= const.betamt
		} else {
			// 0 win, max spin
			credits -= const.betamt * 5
		}
	}
	
	func isMatch(_ index1:Int,_ index2:Int,_ index3:Int) -> Bool {
		if numbers[index1] == numbers[index2] && numbers[index2] == numbers[index3] {
			// update bg green
			backgrounds[index1] = Color.green
			backgrounds[index2] = Color.green
			backgrounds[index3] = Color.green
			return true
		}
		
		return false
	}
}
