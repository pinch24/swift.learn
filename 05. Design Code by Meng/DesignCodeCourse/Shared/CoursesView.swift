//
//  CourcesView.swift
//  DesignCodeCourse
//
//  Created by Bob on 2021/05/30.
//

import SwiftUI

struct CoursesView: View {
    
    @Namespace var namespace
    @Namespace var namespace2
    
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        
        ZStack {
            
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        //.navigationBarTitle("Courses")
    }
    
    var content: some View {
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 54)
                
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                    spacing: 16
                ) {
                    
                    ForEach(courses) { item in
                        
                        VStack {
                            
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(), {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    })
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        
                        #if os(iOS)
                        NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow()
                        #endif
                    }
                }
                .padding(16)
            }
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    var fullContent: some View {
        
        if selectedItem != nil {
            
            ZStack(alignment: .topTrailing) {
                
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0), {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(
                                deadline: .now() + 0.4,
                                execute: { isDisabled = false }
                            )
                        })
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
}

struct CourcesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CoursesView()
    }
}
