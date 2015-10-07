//
//  main.swift
//  simplecalc
//
//  Created by iGuest on 10/7/15.
//  Copyright (c) 2015 Jason Ho. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func addInput() -> Bool {
    
}

while true { //run loop
    var gatheringInput = true
    var basicMathFlag = false
    var inputNum = 0
    println("Enter an expression separated by returns:")
    while gatheringInput {
        gatheringInput = false
        let thisInput = input()
        switch thisInput {
        case "help":
            println("THIS IS THE HELP MENU")
        case "count":
            println("COUNT")
        case "avg":
            println("AVERAGE")
        case "fact":
            println("FACTORIAL")
        case where basicMathFlag:
            println("DO BASIC MATHS")
        default:
            gatheringInput = true
            println("ADD INPUT")
        }
    }
}

class InputList {
    var inputs : [String]
    init() {
        
    }
}