//
//  LoaderView.swift
//  TestApp
//
//  Created by Apple on 3/23/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(2.0, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
