//
//  ContentView.swift
//  cellArrayTest
//
//  Created by John Welch on 10/5/23.
//

import SwiftUI
import Foundation
import Observation

struct ContentView: View {
	@State var gridSize = 3
	@State var selected = 0
	@State var aCount = 0
	@State var theToggle = true
	@State var theTitle = ""
	@State var buttonBlank: Bool = true
	@State var theGame = Game(gridSize: 3)


	var body: some View {
		
		HStack {
			VStack {
				Button {

				} label: {
					Text("Commit Move")
				}
				.disabled(buttonBlank)
			}
			VStack {
				Picker("Board Size", selection: $theGame.gridSize) {
				    Text("3").tag(3)
				    Text("4").tag(4)
				    Text("5").tag(5)
				    Text("6").tag(6)
				    Text("7").tag(7)
				    Text("8").tag(8)
				    Text("9").tag(9)
				    Text("10").tag(10)
				}
				//picker properties
				//padding has to be separate for each dimensions
					.frame(width: 140.0,alignment: .center)
					.padding(.top,2)
					//makes it look like a dropdown list
					.pickerStyle(MenuPickerStyle())

				    //this is how you initiate actions based on a change event
				    //test func to show size of board based on selection
					/*.onChange(of: gridSize) {
					    print("new board size is: \(gridSize)")
						theGame = Game(gridSize: gridSize)
						print("\(theGame.gridSize)")
					}*/
			}

		}
		Grid(horizontalSpacing: 0, verticalSpacing: 0) {
			ForEach(0..<theGame.gridSize, id: \.self) {
				row in
				GridRow {
					ForEach(0..<theGame.gridSize, id: \.self) { col in
						GeometryReader { proxy in
							//set the index for the grid
							let index = (row * theGame.gridSize) + col
							//sanity check to avoid out of bounds errors
							if index <= ((theGame.gridSize * theGame.gridSize) - 1) {
								//sset up what the buttons do
								Button {
									var theTuple = doSomethingElseOnClick(for: theGame.gridCellArr[index].index, myArray: theGame.gridCellArr)
									theGame.gridCellArr[index].backCol = theTuple.myColor
									theGame.gridCellArr[index].title = theTuple.myTitle
									buttonBlank = theTuple.myCommitButtonStatus

									//print("button coords are: \(theGame.gridCellArr[index].xCoord),\(theGame.gridCellArr[index].yCoord)")
									//print("Button index is: \(theGame.gridCellArr[index].index)")
								} label: {
									Text(theGame.gridCellArr[index].title)
										.font(.system(size: 36, weight: .heavy, design: .serif))
										//.fontWeight(.heavy)
										.frame(width: proxy.frame(in: .global).width,height: proxy.frame(in: .global).height)
								}
								.background(theGame.gridCellArr[index].backCol)
								.border(Color.black)

								.onAppear(perform: {
									theGame.gridCellArr[index].xCoord = col
									theGame.gridCellArr[index].yCoord = row
								})
							}
						}
					}
				}
			}
			.id(theGame.gridSize)
		}
	}
}

#Preview {
    ContentView()
}
