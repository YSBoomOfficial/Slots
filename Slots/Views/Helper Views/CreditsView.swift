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
			.padding(.all, 10)
			.background(Color.white.opacity(0.5))
			.cornerRadius(20)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
		CreditsView(vm: ViewModel())
    }
}
