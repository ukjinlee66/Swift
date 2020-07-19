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

    @IBOutlet weak var display: UILabel!
    
    var userisinthemiddleoftyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
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
    
    @IBAction func performoperation(_ sender: UIButton) {
        userisinthemiddleoftyping = false
        if let mathmaticalsymbol = sender.currentTitle
        {
            if mathmaticalsymbol == "π"
            {
                display.text = String(Double.pi)
            }
        }
    }
    
}

