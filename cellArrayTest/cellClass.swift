//
//  cellClass.swift
//  cellArrayTest
//
//  Created by John Welch on 10/5/23.
//

import SwiftUI
import Foundation
import Observation


@Observable  class Cell: Identifiable {
	let id = UUID()
	var title: String = ""
	var buttonToggled: Bool = false
	var index: Int = 0
	var xCoord: Int = 0
	var yCoord: Int = 0
	var backCol: Color = .gray
}

@Observable class Game {
	var gridSize: Int
	var gridCellArr: [Cell] = []

    init(gridSize: Int) {
	   self.gridSize = gridSize
	   self.gridCellArr = buildStructArray(theGridSize: gridSize)
    }

    func buildStructArray(theGridSize: Int) -> [Cell] {
	   var myStructArray: [Cell] = []
	   let arraySize = (theGridSize * theGridSize)
	   for i in 0..<arraySize {
		  myStructArray.append(Cell())
	   }

	    for i in 0..<arraySize {
		    myStructArray[i].index = i
	    }

	   return myStructArray
    }
}

func buildStructArray(theGridSize: Int) -> [Cell] {
	var myStructArray: [Cell] = []
	let arraySize = (theGridSize * theGridSize) - 1
	for i in 0...arraySize {
		myStructArray.append(Cell())
	}

	for i in 0...arraySize {
		myStructArray[i].index = i
	}
	return myStructArray
}

//func doSomethingElseOnClick(for myIndex: Int, myArray: [Cell]) -> Color {
func doSomethingElseOnClick(for myIndex: Int, myArray: [Cell]) -> (myColor: Color, myTitle: String, myCommitButtonStatus: Bool) {
	var theCommitButtonStatus: Bool = true
	switch myArray[myIndex].title {
		case "":
			myArray[myIndex].title = "S"
			theCommitButtonStatus = false
		case "S":
			myArray[myIndex].title = "O"
			theCommitButtonStatus = false
		case "O":
			myArray[myIndex].title = ""
			theCommitButtonStatus = true
		default:
			print("Something went wrong, try restarting the app")
	}

	var theColor: Color
	if myIndex <= 7 {
		let testIndex = myIndex + 1
		//print("\(myArray[testIndex].index)")
		theColor = Color.green
	} else {
		let testIndex = myIndex - 1
		//print("\(myArray[testIndex].index)")
		theColor = Color.blue
	}

	let theReturnTuple = (myColor: theColor, myTitle: myArray[myIndex].title, myCommitButtonStatus: theCommitButtonStatus)
	return theReturnTuple
}



/*func doSomethingOnClick(gridSize: Int, myButtonArray: [GridCell], myIndex: Int) {
	if myIndex < (gridSize * gridSize) - 2 {
		let testIndex = myIndex - 1
		myButtonArray[testIndex].details.title = "Changed!"

	} else {
		let testIndex = myIndex - 1
		myButtonArray[testIndex].details.title = "Changed!"
	}
}*/
