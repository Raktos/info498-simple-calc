//
//  main.swift
//  simplecalc
//
//  Created by Jason Ho on 10/7/15.
//  Copyright (c) 2015 Jason Ho. All rights reserved.
//

import Foundation

//gets input from console
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

//does calculations, stores inputs
class Calculator {
    //stores inputs
    //TODO could be an array of Doubles, does store commands anymore
    var inputs : [String]
    
    init() {
        inputs = [String]()
    }
    
    //converts strings to Doubles
    private func convert(incoming : String) -> Double {
        return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    }
    
    //stores an input
    func getInput(incoming:String) {
        inputs.append(incoming)
    }
    
    //addition
    func add() -> Double {
        return convert(inputs[0]) + convert(inputs[1])
    }
    
    //subtraction
    func sub() -> Double {
        return convert(inputs[0]) - convert(inputs[1])
    }
    
    //multiplication
    func mul() -> Double {
        return convert(inputs[0]) * convert(inputs[1])
    }
    
    //division
    func div() -> Double {
        return convert(inputs[0]) / convert(inputs[1])
    }
    
    //mod
    func mod() -> Double {
        return convert(inputs[0]) % convert(inputs[1])
    }
    
    //averages stored inputs
    func avg() -> Double {
        var total = 0.0
        for number in inputs {
            total += convert(number)
        }
        
        return total / Double(numInputs())
    }
    
    //factorial of first input
    func fact() -> Double {
        var total = convert(inputs[0])
        
        for var i = convert(inputs[0]) - 1; i > 1; i-- {
            total *= i
        }
        
        return total
    }
     //counts total inputs
    func count() -> Double {
        return Double(numInputs())
    }
    
    //private, counts total input
    private func numInputs() -> Int {
        return inputs.count
    }
}

var running = true

//main loop
while running {
    var gatheringInput = true
    var basicMathFlag = false
    var inputNum = 0
    let calc = Calculator()
    
    //starts checking for input
    println("Enter an expression separated by returns:")
    
    //gather input loops, will go around again after an operation is finished (or fails)
    while gatheringInput {
        gatheringInput = false
        let thisInput = input()
        
        //handle inputs
        switch thisInput {
        case "quit", "q":
            running = false
        case "help":
            println("Enter operands seperated by returns. + - * / % avg fact and count are legal operations. 'quit' will quit the program")
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
        
        //handle basic math functions
        case"+", "add", "-", "sub", "*", "mul", "/", "div", "%", "mod":
            if calc.count() > 1 {
                println("too many operands")
            } else {
                calc.getInput(input())
                switch thisInput {
                case "+", "add":
                    println("\(calc.add())")
                case "-", "sub":
                    println("\(calc.sub())")
                case "*", "mul":
                    println("\(calc.mul())")
                case "/", "div":
                    println("\(calc.div())")
                case "%", "mod":
                    println("\(calc.mod())")
                default:
                    break
                }
            }
        
        //default, put input into calculator
        default:
            calc.getInput(thisInput)
            gatheringInput = true
        }
    }
}