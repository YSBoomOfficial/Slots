//
//  CardsGroupView.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//  Copyright © 2021 Yash. All rights reserved.
//

import SwiftUI

struct CardsGroupView: View {
	@ObservedObject var vm: ViewModel
	
    var body: some View {
		VStack {
			HStack {
				Spacer()
				CardView(Symbol: $vm.symbols[vm.numbers[0]], background: $vm.backgrounds[0])
				CardView(Symbol: $vm.symbols[vm.numbers[1]], background: $vm.backgrounds[1])
				CardView(Symbol: $vm.symbols[vm.numbers[2]], background: $vm.backgrounds[2])
				Spacer()
			}
			HStack {
				Spacer()
				CardView(Symbol: $vm.symbols[vm.numbers[3]], background: $vm.backgrounds[3])
				CardView(Symbol: $vm.symbols[vm.numbers[4]], background: $vm.backgrounds[4])
				CardView(Symbol: $vm.symbols[vm.numbers[5]], background: $vm.backgrounds[5])
				Spacer()
			}
			HStack {
				Spacer()
				CardView(Symbol: $vm.symbols[vm.numbers[6]], background: $vm.backgrounds[6])
				CardView(Symbol: $vm.symbols[vm.numbers[7]], background: $vm.backgrounds[7])
				CardView(Symbol: $vm.symbols[vm.numbers[8]], background: $vm.backgrounds[8])
				Spacer()
			}
			
		}
    }
}

struct CardsGroupView_Previews: PreviewProvider {
    static var previews: some View {
		CardsGroupView(vm: ViewModel())
    }
}
