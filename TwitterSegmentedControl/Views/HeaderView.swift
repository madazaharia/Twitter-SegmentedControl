//
//  HeaderView.swift
//  TwitterSegmentedControl
//
//  Created by Madalin Zaharia on 17.03.2023.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    @State var selectedTab = Tab.allCases.first!
    let tabs = Tab.allCases
    
    // 1
    @Namespace private var namespace
    
    // MARK: - Drawing
    var body: some View {
        ZStack(alignment: .bottom) {
            buttons
            underline
        }
        .padding(.horizontal)
    }
    
    var buttons: some View {
        HStack {
            ForEach(tabs, id: \.rawValue) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab.title)
                        .foregroundColor(tab == selectedTab ? .black: .gray)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.vertical, 8)
                        // 2
                        .matchedGeometryEffect(id: tab, in: namespace, properties: .frame, isSource: true)
                        .frame(maxWidth: .infinity) /// for evenly distributed across the entire screen
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
    
    var underline: some View {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(.teal)
            .frame(height: 3)
            // 3
            .matchedGeometryEffect(id: selectedTab, in: namespace, properties: .frame, isSource: false)
            .animation(.easeOut(duration: 0.3), value: selectedTab)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
