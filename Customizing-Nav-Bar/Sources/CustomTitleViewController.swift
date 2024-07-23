//
//  CustomTitleViewController.swift
//  Customizing-Nav-Bar
//
//  Created by ZENA on 7/23/24.
//

import UIKit

final class CustomTitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let control = UISegmentedControl(items: ["Image", "Text", "Video"])
        control.selectedSegmentIndex = 1
        control.autoresizingMask = .flexibleWidth
        navigationItem.titleView = control
    }
}
