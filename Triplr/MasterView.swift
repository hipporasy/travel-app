//
//  MasterView.swift
//  Triplr
//
//  Created by Marasy Phi on 7/2/21.
//

import SwiftUI

struct MasterView: View {
    
    @State var selectedTabBar: TabBarType = .world
    
    enum TabBarType: String, Identifiable, CaseIterable {
        case world, search, collage, profile
        
        var id: String {
            return "ic.\(rawValue)"
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    switch selectedTabBar {
                    case .world:
                        HomeView()
                    default:
                        Color.white
                    }
                    HStack {
                        Spacer()
                        ForEach(TabBarType.allCases) { eachTab in
                            TabBarView(type: eachTab, isActive: selectedTabBar == eachTab)
                                .onTapGesture {
                                    selectedTabBar = eachTab
                                }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: geometry.safeAreaInsets.bottom + 49)
                    .background(Color.lightGrey)
                    .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
        }
    }
    
}

struct TabBarView: View {
    
    let type: MasterView.TabBarType
    let isActive: Bool
    var body: some View {
        Image(type.id)
            .foregroundColor(isActive ? .primaryColor: .darkText)
    }
    
}

struct MasterViewPreview: PreviewProvider {
    
    static var previews: some View {
        MasterView()
    }
    
}
