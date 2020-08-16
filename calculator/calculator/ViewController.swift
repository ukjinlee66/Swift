//
//  ViewController.swift
//  calculator
//
//  Created by leeyoukjin on 2020/07/15.
//  Copyright © 2020 Youlee. All rights reserved.
//

import UIKit //module
//UIKit 은 버튼 텍스트필드 등 모든 UI가 담겨있다.
class ViewController: UIViewController{ //UIViewController 를 상속받았으며
    //swift 는 단 한개의 상속만 받을 수 있다. 모든 MVC 컨트롤러는 위 컨트롤러를 상속받아야만 한다.

    @IBOutlet private weak var display: UILabel!
    
    private var userisinthemiddleoftyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let Digit = sender.currentTitle!
        if userisinthemiddleoftyping
        {
            let textcurrentlyindisplay = display.text!
            display.text! = textcurrentlyindisplay + Digit
        }
        else
        {
            display.text = Digit
        }
        userisinthemiddleoftyping = true
    }
    private var displayvalue : Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var Brain = calculatorBrain()
    
    @IBAction private func performoperation(_ sender: UIButton) {
        if userisinthemiddleoftyping
        {
            Brain.setOperend(operend: displayvalue)
            userisinthemiddleoftyping = false
        }
        
        if let mathmaticalsymbol = sender.currentTitle
        {
            Brain.performOperation(symbol: mathmaticalsymbol)
        }
        displayvalue = Brain.result
    }
}

