//
//  CustomRightViewController.swift
//  Customizing-Nav-Bar
//
//  Created by ZENA on 7/23/24.
//

import UIKit

final class CustomRightViewController: UIViewController {
    
    enum SegmentedControl: Int {
        case text = 0
        case image
        case view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Right Control"
    }
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        guard let selectedControl = SegmentedControl(rawValue: sender.selectedSegmentIndex) else { return }
        switch selectedControl {
        case .text:
            let item = UIBarButtonItem(
                title: "Add",
                style: .plain,
                target: self,
                action: nil
            )
            navigationItem.rightBarButtonItem = item
        case .image:
            let item = UIBarButtonItem(
                image: UIImage(systemName: "envelope"),
                style: .plain,
                target: self,
                action: nil
            )
            navigationItem.rightBarButtonItem = item
        case .view:
            let control = UISegmentedControl(
                items: [
                    UIImage(systemName: "arrow.up")!,
                    UIImage(systemName: "arrow.down")!
                ]
            )
            let item = UIBarButtonItem(customView: control)
            navigationItem.rightBarButtonItem = item
            break
        }
    }
}
