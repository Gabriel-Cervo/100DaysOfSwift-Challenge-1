//
//  ViewController.swift
//  100DaysOfSwift-Challenge1
//
//  Created by João Gabriel Dourado Cervo on 27/01/21.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let itens = try! fm.contentsOfDirectory(atPath: path)
        
        for item in itens {
            if item.hasSuffix(".png") {
                // faz algo
            }
        }
    }


}

