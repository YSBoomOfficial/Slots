//
//  CardView.swift
//  Slots
//
//  Created by Yash Shah on 30/12/2020.
//

import SwiftUI

struct CardView: View {
    @Binding var Symbol: String
    @Binding var background: Color
    
    var body: some View {
        Image(Symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .scaleEffect(0.8)
            .background(background.opacity(0.25))
            .cornerRadius(20)        
    }
    
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(Symbol: Binding.constant("apple"), background: Binding.constant(Color.white))
        }
    }
}
