//
//  SecondView.swift
//  SwiftUITest
//
//  Created by mk on 2020/09/28.
//

import SwiftUI

struct SecondView: View {
	
	@ObservedObject var timerData: TimerData
	
	var body: some View {
		
		VStack {
			
			Text("Second View")
				.font(.largeTitle)
			
			Text("Timer Count = \(timerData.timeCount)")
				.font(.headline)
		}
		.padding()
	}
	
	func resetCount() {
		
		timerData.resetCount()
	}
}

struct SecondView_Previews: PreviewProvider {
	
	static var previews: some View {
		
		SecondView(timerData: TimerData())
	}
}
