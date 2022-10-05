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
				ForEach(0...2, id: \.self) {
					CardView(symbol: $vm.symbols[vm.numbers[$0]], background: $vm.backgrounds[$0])
				}
				Spacer()
			}

			HStack {
				Spacer()
				ForEach(3...5, id: \.self) {
					CardView(symbol: $vm.symbols[vm.numbers[$0]], background: $vm.backgrounds[$0])
				}
				Spacer()
			}

			HStack {
				Spacer()
				ForEach(6...8, id: \.self) {
					CardView(symbol: $vm.symbols[vm.numbers[$0]], background: $vm.backgrounds[$0])
				}
				Spacer()
			}
		}
	}
}

struct CardsGroupView_Previews: PreviewProvider {
	static var previews: some View {
		CardsGroupView(vm: ViewModel())
			.preferredColorScheme(.dark)
	}
}
