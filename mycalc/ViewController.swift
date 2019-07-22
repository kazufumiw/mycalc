//
//  ViewController.swift
//  mycalc
//
//  Created by aa373340 on 2019/06/21.
//  Copyright © 2019 aa373340. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UILabel!
    @IBOutlet weak var resultField: UILabel!
    var isAddButtonActive: Bool = true
    var isSubButtonActive: Bool = false
    var isMultiplyButtonActive: Bool = false
    var isDivideButtonActive: Bool = false
    var isEqualButtonActive: Bool = false
    var isOperand: Bool = true
    var isOperator: Bool = false
    var operand_1: Float = 0
    var operand_2: Float = 0
    var calcResult: Float = 0
    var isResultFieldDotted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultField.text = "0"
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    func calc(x: Float, y: Float) -> Float{
        var result: Float = 0
        if(isAddButtonActive){
            result = x + y
        }else if(isSubButtonActive){
            result = x - y
        }else if(isMultiplyButtonActive){
            result = x * y
        }else if(isDivideButtonActive){
            result = x / y
        }else if(isEqualButtonActive){
            result = y
        }else{
            print("calc_else")
        }
        return result
    }
    func tapOperand(tappedNumber: String){
        if(resultField.text == "0"){
            resultField.text = ""
        }
        if(isOperand){
            resultField.text = resultField.text! + tappedNumber
        }else if(isOperator){
            resultField.text = tappedNumber
            isResultFieldDotted = false
            isOperand = true
        }else{
            print("error")
        }
    }
    func tapOperator(){
        if(isOperand){
            operand_2 = Float(resultField.text!)!
            calcResult = calc(x: operand_1, y: operand_2)
            operand_1 = calcResult
            if(Float(Int(calcResult)) == calcResult){
                resultField.text = String(Int(calcResult))
                isResultFieldDotted = false
            }else{
                resultField.text = String(calcResult)
                isResultFieldDotted = true
            }
        }
        init_operator()
        isOperator = true
    }
    func init_operator(){
        isAddButtonActive = false
        isSubButtonActive = false
        isMultiplyButtonActive = false
        isDivideButtonActive = false
        isOperand = false
        isOperator = false
    }
    @IBAction func tapButton0(_ sender: Any) {
        tapOperand(tappedNumber: "0")
    }
    @IBAction func tapButton1(_ sender: Any) {
        tapOperand(tappedNumber: "1")
    }
    @IBAction func tapButton2(_ sender: Any) {
        tapOperand(tappedNumber: "2")
    }
    @IBAction func tapButton3(_ sender: Any) {
        tapOperand(tappedNumber: "3")
    }
    @IBAction func tapButton4(_ sender: Any) {
        tapOperand(tappedNumber: "4")
    }
    @IBAction func tapButton5(_ sender: Any) {
        tapOperand(tappedNumber: "5")
    }
    @IBAction func tapButton6(_ sender: Any) {
        tapOperand(tappedNumber: "6")
    }
    @IBAction func tapButton7(_ sender: Any) {
        tapOperand(tappedNumber: "7")
    }
    @IBAction func tapButton8(_ sender: Any) {
        tapOperand(tappedNumber: "8")
    }
    @IBAction func tapButton9(_ sender: Any) {
        tapOperand(tappedNumber: "9")
    }
    @IBAction func addButton(_ sender: Any) {
        tapOperator()
        isAddButtonActive = true
    }
    @IBAction func tapSubButton(_ sender: Any) {
        tapOperator()
        isSubButtonActive = true
    }
    @IBAction func multyplyButton(_ sender: Any) {
        tapOperator()
        isMultiplyButtonActive = true
    }
    @IBAction func tapDivideButton(_ sender: Any) {
        tapOperator()
        isDivideButtonActive = true
    }
    @IBAction func dotButton(_ sender: Any) {
        if(isOperand){
            if(!isResultFieldDotted){
                resultField.text = resultField.text! + "."
                isResultFieldDotted = true
                isOperand = true
            }
        }else if(isOperator){
            resultField.text = "0."
            isOperand = true
        }else{
            print("dot_else")
        }
    }
    @IBAction func tapEqualButton(_ sender: Any) {
        tapOperator()
        isEqualButtonActive = true
    }
    @IBAction func tapPercentButton(_ sender: Any) {
        resultField.text = String(Float(resultField.text!)!*0.01)
    }
    @IBAction func tapCButton(_ sender: Any) {
        resultField.text = "0"
    }
    @IBAction func tapACButton(_ sender: Any) {
        isAddButtonActive = true
        isSubButtonActive = false
        isMultiplyButtonActive = false
        isDivideButtonActive = false
        isEqualButtonActive = false
        isOperand = true
        isOperator = false
        operand_1 = 0
        operand_2 = 0
        calcResult = 0
        isResultFieldDotted = false
        resultField.text = "0"
    }
}



