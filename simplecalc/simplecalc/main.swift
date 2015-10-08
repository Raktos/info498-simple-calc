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

class Calculator {
    var inputs : [String]
    
    init() {
        inputs = [String]()
    }
    
    private func convert(incoming:String) -> Double {
        return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    }
    
    func getInput(incoming:String) {
        inputs.append(incoming)
    }
    
    func add() -> Double {
        return convert(inputs[0]) + convert(inputs[2])
    }
    
    func sub() -> Double {
        return convert(inputs[0]) - convert(inputs[2])
    }
    
    func mul() -> Double {
        return convert(inputs[0]) * convert(inputs[2])
    }
    
    func div() -> Double {
        return convert(inputs[0]) / convert(inputs[2])
    }
    
    func mod() -> Double {
        return convert(inputs[0]) % convert(inputs[2])
    }
    
    func avg() -> Double {
        var total = 0.0
        for number in inputs {
            total += convert(number)
        }
        
        return total / Double(numInputs())
    }
    
    func fact() -> Double {
        var total = convert(inputs[0])
        
        for var i = convert(inputs[0]) - 1; i > 1; i-- {
            total *= i
        }
        
        return total
    }
    
    func count() -> Double {
        return Double(numInputs())
    }

    private func numInputs() -> Int {
        return inputs.count
    }
}

while true { //run loop
    var gatheringInput = true
    var basicMathFlag = false
    var inputNum = 0
    let calc = Calculator()
    println("Enter an expression separated by returns:")
    while gatheringInput {
        gatheringInput = false
        let thisInput = input()
        switch thisInput {
        case "help":
            println("THIS IS THE HELP MENU")
        case "count":
            println("\(calc.count())")
        case "avg":
            println("\(calc.avg())")
        case "fact":
            if calc.numInputs() > 1{
                println("cannot factorial more than one input")
            } else {
                println("\(calc.fact())")
            }
        default:
            calc.getInput(thisInput)
            gatheringInput = true
        }
    }
}

/*switch thisInput{
case "+", "add":
case "-", "sub":
case "*", "mul":
case "/", "div":
case "%", "mod":
default:
}*/

