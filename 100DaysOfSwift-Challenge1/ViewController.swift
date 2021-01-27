//
//  ViewController.swift
//  100DaysOfSwift-Challenge1
//
//  Created by João Gabriel Dourado Cervo on 27/01/21.
//

import UIKit

class ViewController: UITableViewController {
    var countriesSet = Set<String>()
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let itens = try! fm.contentsOfDirectory(atPath: path)
        
        for item in itens {
            if item.hasSuffix(".png") {
                let index = item.firstIndex(of: "@")!
                countriesSet.insert(String(item[..<index]))
            }
        }
        
        countries = Array(countriesSet)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        let index = indexPath.row
        
        cell.textLabel?.text = countries[index]
        cell.imageView?.image = UIImage(named: countries[index])
        
        return cell
    }


}

