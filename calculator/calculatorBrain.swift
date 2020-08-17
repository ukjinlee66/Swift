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
    
    private var operations: Dictionary<String,Operation> =
    [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "−" : Operation.BinaryOperation({ $0 - $1}),
        "×" : Operation.BinaryOperation({ $0 * $1}),
        "÷" : Operation.BinaryOperation({ $0 / $1}),
        "=" : Operation.Equals,
        "∁" : Operation.Clear
    ]
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        case Clear
    }
    func performOperation(symbol : String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinartOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperend: accumulator)
            case .Equals:
                executePendingBinartOperation()
            case .Clear: accumulator = 0.0
            }
        }
    }
    private func executePendingBinartOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperend, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo{
        var binaryFunction : (Double, Double) -> Double
        var firstOperend : Double
    }
    var result : Double{
        get{
            return accumulator
        }
    }
    
}
