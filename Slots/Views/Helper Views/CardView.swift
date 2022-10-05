//
//  CardView.swift
//  Slots
//
//  Created by Yash Shah on 30/12/2020.
//

import SwiftUI

struct CardView: View {
	@Binding var symbol: Symbol
	@Binding var background: Color

	private let transition: AnyTransition = .move(edge: .bottom)

	var body: some View {
		VStack {
			switch symbol {
				case .apple:
					Image(symbol.rawValue)
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.scaleEffect(0.8)
						.transition(transition)
				case .star:
					Image(symbol.rawValue)
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.scaleEffect(0.8)
						.transition(transition)
				case .cherry:
					Image(symbol.rawValue)
						.resizable()
						.aspectRatio(1, contentMode: .fit)
						.scaleEffect(0.8)
						.transition(transition)
			}
		}
		.background(background.opacity(0.25))
		.cornerRadius(20)
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(symbol: .constant(.apple), background: .constant(.green))
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
