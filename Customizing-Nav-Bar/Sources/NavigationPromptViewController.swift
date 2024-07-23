//
//  NavigationPromptViewController.swift
//  Customizing-Nav-Bar
//
//  Created by ZENA on 7/23/24.
//

import UIKit

final class NavigationPromptViewController: UIViewController {
    
    override func viewDidLoad() {
        self.title = "Navigation Prompt"
        self.navigationItem.prompt = "Navigation prompts appear at the top"
    }
}
