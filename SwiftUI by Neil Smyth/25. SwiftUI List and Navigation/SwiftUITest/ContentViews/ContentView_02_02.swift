//
//  ContentView_02_02.swift
//  SwiftUITest
//
//  Created by mk on 2020/10/02.
//
// 25.2 Dynamic List

import SwiftUI

//struct ToDoItem: Identifiable {
//
//	var id = UUID()
//	var task: String
//	var imageName: String
//}

struct ContentView_02_02: View {
	
	@State var toggleStatus = true
	
	var listData: [ToDoItem] = [
		
		ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
		ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
		ToDoItem(task: "Wash the car", imageName: "car.fill"),
		ToDoItem(task: "Vaccum house", imageName: "house.fill"),
	]
	
	var body: some View {
		
		List {
			
			Toggle(isOn: $toggleStatus, label: { Text("Allow Notifications") })
			
			ForEach (listData) { item in
				
				HStack {
					
					Image(systemName: item.imageName)
					Text(item.task)
				}
			}
		
		}
	}
}

struct ContentView_02_02_Previews: PreviewProvider {
	
	static var previews: some View {
		
		ContentView_02_02()
	}
}
