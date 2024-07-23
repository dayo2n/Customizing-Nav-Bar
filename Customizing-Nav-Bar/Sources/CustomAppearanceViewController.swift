//
//  CustomAppearanceViewController.swift
//  Customizing-Nav-Bar
//
//  Created by ZENA on 7/23/24.
//

import UIKit

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

final class CustomAppearanceViewController: UITableViewController {
    
    @IBOutlet var backgroundSwitcher: UISegmentedControl!
    
    private let dataSource = CitiesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        
        // toolbar
        let backgroundSwitcherItem = UIBarButtonItem(customView: backgroundSwitcher)
        navigationController?.isToolbarHidden = false
        toolbarItems = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            backgroundSwitcherItem,
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
        
        // inital background appearance
        applyImageBackgroundAppearance()
    }
    
    @IBAction func backgroundValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            applyImageBackgroundAppearance()
        case 1:
            applyColorBackgroundAppearance()
        default:
            break
        }
    }
    
    private func applyImageBackgroundAppearance() {
        guard let bounds = navigationController?.navigationBar.bounds else { return }
        let backgroundImageMetrics = UIImage.gradientImage(
            bounds: bounds,
            colors: [UIColor.systemBlue.cgColor, UIColor.systemCyan.cgColor]
        ).resizableImage(
            withCapInsets: UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: bounds.size.height - 1,
                right: bounds.size.width - 1
            )
        )
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundImage = backgroundImageMetrics
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
    }
    
    private func applyColorBackgroundAppearance() {
        let tintColor = UIColor.systemGreen
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = tintColor
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
    }
}
