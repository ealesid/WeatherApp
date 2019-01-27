//
//  TabBarController.swift
//  WeatherApp
//
//  Created by Aleksey Sidorov on 27/01/2019.
//  Copyright © 2019 Aleksey Sidorov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let nextViewSegues = [
        "nextViewIsCollection",
        "nextViewIsTable",
    ]

    @IBOutlet weak var btnNextView: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   }

    @IBAction func btnNextViewPressed(_ sender: UIBarButtonItem) {
        print("TabBarController", self.selectedIndex, self.selectedViewController!)
        self.performSegue(withIdentifier: self.nextViewSegues[self.selectedIndex], sender: nil)
    }
}
