//
//  ViewController.swift
//  RainbowTabs
//
//  Created by BHAGWANT SINGH on 2022-03-12.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "!"
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tabBarItem.badgeValue = nil
    }


}

