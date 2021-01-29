//
//  ViewController.swift
//  MyProject
//
//  Created by 이영재 on 2021/01/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    private var answer : Int = 0
    private var countGuseeNum : Int = 0
    private var trial : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer = Int.random(in: 0..<100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func button(_ sender: Any) {
        if trial {
            countGuseeNum = 0
            textField.text! = ""
            answer = Int.random(in: 0..<100)
            trial = false
        }
        
        if (Int(textField.text!) != nil) {
            let inputNumber = Int(textField.text!)
            countGuseeNum += 1
            
            if (inputNumber == answer) {
                label.text = "That's Right Bro!"
                trial = true
            }
            else {
                label.text = inputNumber! < answer ? "Try Higher!" : "Try Lower"
            }
            textField.text = ""
        }
        else {
            label.text = "Enter The Number You Want!"
        }
    }
}

