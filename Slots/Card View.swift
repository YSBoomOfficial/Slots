//
//  Card View.swift
//  Slots
//
//  Created by Yash Shah on 14/12/2020.
//  Copyright © 2020 Yash. All rights reserved.
//

import SwiftUI

struct Card_View: View {
    var body: some View {
        
        ZStack {
            Image("heart").resizable()
                .aspectRatio(1, contentMode: .fit)
                .scaleEffect(0.8)
                .background(Color.white.opacity(0.25))
                .cornerRadius(20)
        }
    }
    
    struct Card_View_Previews: PreviewProvider {
        static var previews: some View {
            Card_View()
        }
    }
}
