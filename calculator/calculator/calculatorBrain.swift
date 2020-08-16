//
//  calculatorBrain.swift
//  calculator
//
//  Created by leeyoukjin on 2020/07/20.
//  Copyright © 2020 Youlee. All rights reserved.
//

import Foundation

class calculatorBrain{
    private var accumulator = 0.0
    func setOperend(operend : Double){
        accumulator = operend
    }
    var operations: Dictionary<String,Operation> =
    [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos)
    ]
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }
    func performOperation(symbol : String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation: break
            case .Equals: break
            }
        }
    }
    var result : Double{
        get{
            return accumulator
        }
    }
    
}
