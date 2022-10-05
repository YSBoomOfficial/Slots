//
//  Credits View.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//  Copyright © 2021 Yash. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
	@ObservedObject var vm: ViewModel
	
    var body: some View {
		Text("Credits: \(vm.credits)")
			.padding(10)
			.background(vm.win ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
			.animation(.none)
			.cornerRadius(20)
			.scaleEffect(vm.win ? 1.2 : 1)
			.animation(.spring(response: 0.7, dampingFraction: 0.5))
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
		CreditsView(vm: ViewModel())
    }
}
