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
				.frame(width: 150, height: 75, alignment: .center)
			ZStack {
				Image(systemName: "star.fill")
					.foregroundColor(.black)
					.scaleEffect(2.5)
				Image(systemName: "star.fill").foregroundColor(.white)
					.scaleEffect(2)
			}
			Spacer()
		}
	}
}

struct TitleView_Previews: PreviewProvider {
	static var previews: some View {
		TitleView()
			.background(Color.gray)
	}
}
