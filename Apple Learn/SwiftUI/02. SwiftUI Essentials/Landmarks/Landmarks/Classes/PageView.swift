//
//  PageView.swift
//  Landmarks
//
//  Created by mk on 2019/10/21.
//  Copyright © 2019 mk. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PageView(features.map { FeatureCard(landmark: $0) })
    }
}
