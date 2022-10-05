//
//  TitleView.swift
//  Slots
//
//  Created by Yash Shah on 30/09/2021.
//

import SwiftUI

struct TitleView: View {
	var body: some View {
		HStack {
			Spacer()
			Image(systemName: "star")
			Text("Slots").padding()
			Image(systemName: "star")
			Spacer()
		}
		.font(.largeTitle.weight(.black))
		.foregroundColor(.white)
	}
}

struct TitleView_Previews: PreviewProvider {
	static var previews: some View {
		TitleView()
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.black)
	}
}
