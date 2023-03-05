//
//  CertificatesView.swift
//  CombineAndData
//
//  Created by Roman Liukevich on 2/15/23.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var certificateVM = CertificateViewModel()
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            ForEach (certificateVM.certificates.indices, id: \.self) { index in
                CertificateCard(selection: $selection)
                    .padding(.horizontal, 8)
                    .environmentObject(certificateVM)
                 
            }
        }
        .background(AccountBackground())
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
