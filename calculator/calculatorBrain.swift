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
    func performOperation(symbol : String){
        switch symbol {
        case "π": accumulator = Double.pi
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }
    var result : Double{
        get{
            return accumulator
        }
    }
    
}
