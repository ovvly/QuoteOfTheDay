//
// Created by Jakub Sowa on 30/09/2021.
//

import Foundation
import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("info")
                Spacer()
            }
            Spacer()
        }
        .background(Color.bookBackground, ignoresSafeAreaEdges: .top)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()            
    }
}
