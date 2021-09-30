//
//  SpinButtons.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//  Copyright © 2021 Yash. All rights reserved.
//

import SwiftUI

struct SpinButtons: View {
	@ObservedObject var vm: ViewModel
	
    var body: some View {
		HStack {
			// spin mid
			VStack {
				Button() {
					// process single win
					vm.processResults()
				} label: {
					Text("Spin middle")
						.fontWeight(.black)
						.foregroundColor(.white)
						.padding(.vertical, 10)
						.padding(.horizontal, 20)
						.background(Color.blue)
						.cornerRadius(20)
				}
				
				Text("\(const.betamt) Credits")
					.padding(.top, 5)
					.foregroundColor(.white)
					.font(.subheadline)
			}
			// spin all
			VStack {
				Button() {
					// process single win
					vm.processResults(true)
				} label: {
					Text("Spin All")
						.fontWeight(.black)
						.foregroundColor(.white)
						.padding(.vertical, 10)
						.padding(.horizontal, 40)
						.background(Color.purple)
						.cornerRadius(20)
				}
				
				Text("\(const.betamt*5) Credits")
					.padding(.top, 5)
					.foregroundColor(.white)
					.font(.subheadline)
			}
		}
    }
}

struct SpinButtons_Previews: PreviewProvider {
    static var previews: some View {
		SpinButtons(vm: ViewModel())
    }
}
