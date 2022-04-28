//
//  ViewController.swift
//  Class03
//
//  Created by 이영재 on 2021/11/28.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var label: UILabel!
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLabel(_ sender: Any) {
        self.label.text = "Hello, Swift"
    }
}

