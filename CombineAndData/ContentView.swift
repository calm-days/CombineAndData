

import SwiftUI

struct ContentView: View {
    @State private var contentOffset = CGFloat(0)
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var showCertificates = true
    @AppStorage("isLiteMode") var isLiteMode: Bool = false

    var body: some View {
        NavigationView {
            
            ZStack (alignment: .top) {
                TrackableScrollView(offsetChanged: { offset in
                    contentOffset = offset.y
                }) {
                    content
                }
                
                VisualEffectBlur (blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation (.easeIn)
                    .ignoresSafeArea ()
                    .frame (height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
        
       
        
    }
    
    var content: some View {
        VStack {
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                    //print("1")
                }
            
            VStack {
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }

                divider
                
                NavigationLink(destination: PackagesView()) {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")                }
                
                divider
                
                Link(destination: URL(string: "https://stackoverflow.comModel")!, label: {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })
                
            }
            .blurBackground()
            .padding(.top, 20)
            
            Text("Version 1.00")
                .foregroundColor(.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .font(.footnote)
            
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
//        .sheet(isPresented: $showCertificates, content: {
//            CertificatesView()
//
//        })
        
       
        
    }
    
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
