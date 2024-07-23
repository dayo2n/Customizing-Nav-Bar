//
//  CitiesDataSource.swift
//  Customizing-Nav-Bar
//
//  Created by ZENA on 7/23/24.
//

import UIKit

class CitiesDataSource: NSObject {
    fileprivate var cities: [String] = []
    
    override init() {
        super.init()
        
        let citiesJSONURL =
            URL(fileURLWithPath: Bundle.main.path(forResource: "Cities", ofType: "json")!)
        do {
            let citiesJSONData = try Data(contentsOf: citiesJSONURL)
            cities = try JSONDecoder().decode([String].self, from: citiesJSONData)
        } catch {
            //..
        }
    }
    
    @objc
    func city(index: Int) -> String {
        return cities[index]
    }
}

extension CitiesDataSource: UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flavor = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = flavor
        return cell
    }
}
