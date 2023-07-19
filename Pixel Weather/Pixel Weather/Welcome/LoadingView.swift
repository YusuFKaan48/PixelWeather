//
//  LoadingView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
