//
//  BGView.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//  

import SwiftUI

struct BGView: View {
    var body: some View {
		ZStack {
			Rectangle()
				.foregroundColor(Color(red: 32/255, green: 32/255, blue: 32/255))
				.edgesIgnoringSafeArea(.all)
			Rectangle()
				.foregroundColor(Color(red: 64/255, green: 64/255, blue: 64/255))
				.rotationEffect(Angle(degrees: 45))
				.edgesIgnoringSafeArea(.all)
		}
    }
}

struct BGView_Previews: PreviewProvider {
    static var previews: some View {
        BGView()
    }
}
