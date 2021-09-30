//
//  SwiftUIView.swift
//  Slots
//
//  Created by Yash Shah on 25/02/2021.
//  Copyright © 2021 Yash. All rights reserved.
//

import SwiftUI

struct MonochromeView: View {
    var body: some View {
        Text("👻")
            .saturation(0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MonochromeView()
    }
}
