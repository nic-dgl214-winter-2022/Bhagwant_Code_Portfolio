//
//  ViewController.swift
//  IBBasics
//
//  Created by BHAGWANT SINGH on 2022-03-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.tintColor = .red
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("The Button was pressed")
    }
    
  
    
}

