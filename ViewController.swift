ViewController.swift
//  ViewController.swift
//  RironN
//

//  Copyright © 2017年 shohei. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    var resultLabel = UILabel()
    
    
    let numRows = 4
    let numColumns = 5
    let btnMargin = 10
    let labelHeight = 190
    var num1:Double = 0.0
    var num2:Double = 0.0
    var calcResult = 0.0
    var operatorType:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.frame = CGRect(x:10, y:25, width:310, height: 150 )
        resultLabel.backgroundColor = UIColor.lightGray
        resultLabel.text = "0"
        resultLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(resultLabel)
        
        let btnLabel = ["7","8","9","+","4","5","6","x","1","2","3","-","0","c","÷","=","25%","30%","35%","x12"]
        for i in 0..<numRows {
            for j in 0..<numColumns {
                let button = UIButton()
                let btnwidth =  70
                let btnHeight = btnwidth
                let btnX = btnMargin + ( 10 + btnwidth )*i
                let btnY = 180 + btnMargin + ( 10 + btnwidth )*j
                button.frame = CGRect(x: btnX, y: btnY, width: btnwidth, height: btnHeight)
                button.backgroundColor = UIColor.purple
                let btnNum:Int = j * numRows + Int(i)
                button.setTitle(btnLabel[btnNum], for: UIControlState.normal)
                button.addTarget(self, action: #selector(buttonTouched), for: UIControlEvents.touchUpInside)
                self.view.addSubview(button)
            }
        }
    }
    
    func buttonTouched(sender: UIButton){
        let btnTitle:String = sender.currentTitle!
        print("\(btnTitle)ok")
        
        switch btnTitle {
        case "7","8","9","4","5","6","1","2","3","0":
            numberTouched(btnTitle: btnTitle)
        case "+","x","-","÷":
            operatorTouched(btnTitle:btnTitle)
        case "=":
            equalTouched(btnTitle: btnTitle)
        case "25%","30%","35%","x12":
            hrTouched(btnTitle: btnTitle)
        default:
            clearTouched(btnTitle: btnTitle)
        }
    }
    
    func numberTouched(btnTitle:String){
        print("数字")
        let btnValue:Double = Double(btnTitle)!
        num1 = num1 * 10 + btnValue
        resultLabel.text = String(format:"%.0f",num1)
    }
    func operatorTouched(btnTitle:String){
        print("掛け算とか")
        operatorType = btnTitle
        num2 = num1
        num1 = 0
    }
    func equalTouched(btnTitle:String){
        print("＝")
        switch operatorType {
        case "+":
            calcResult = num1 + num2
        case "x":
            calcResult = num1 * num2
        case "-":
            calcResult = num1 - num2
        case "÷":
            calcResult = num1 / num2
//        case "30%":
//            calcResult = Double("resultLabel.text")! * 0.3
//        case "35%":
//            calcResult = Double("resultLabel.text")! * 0.35
//        case "25%":
//            calcResult = Double("resultLabel.text")! * 0.25
//        case "x12":
//            calcResult = Double("resultLabel.text")! * 12

        default:
            print("その他")
        }
        num1 = calcResult
        resultLabel.text = String("\(calcResult)")
    }
    
    func clearTouched(btnTitle:String){
        print("C")
        num1 = 0
        num2 = 0
        operatorType = ""
        resultLabel.text = "0"
    }
    
    func hrTouched(btnTitle:String){
        print("C")
       
     switch btnTitle {
        case "30%":
            calcResult = num1 * 0.3
        case "35%":
            calcResult = num1 * 0.35
        case "25%":
            calcResult = num1 * 0.25
        case "x12":
            calcResult = num1 * 12
        default:
            print("その他")
        }
        
        num1 = calcResult
        resultLabel.text = String("\(calcResult)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}






