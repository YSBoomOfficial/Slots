//
//  ContentView.swift
//  Slots
//
//  Created by Yash on 16/08/2020.
//

import SwiftUI

struct ContentView: View {
	@StateObject var vm = ViewModel()
	
	var body: some View {
		ZStack {
			//background
			BGView()
			
			VStack {
				//Title
				TitleView()
				
				Spacer()
				
				//Credits Counter
				CreditsView(vm: vm)
				
				Spacer()
				
				// cards
				CardsGroupView(vm: vm)
				
				Spacer()
				Spacer()
				
				//Spin Buttons
				SpinButtons(vm: vm)
				
				Spacer()
			}
		}
	}
	
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
