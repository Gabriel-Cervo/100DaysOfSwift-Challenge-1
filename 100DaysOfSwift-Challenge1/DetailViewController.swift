//
//  DetailViewController.swift
//  100DaysOfSwift-Challenge1
//
//  Created by João Gabriel Dourado Cervo on 27/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageToLoad = imageName else { return }
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView.image = UIImage(named: imageToLoad)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }
    
    @objc func shareImage() {
        guard let imageData = imageView.image?.pngData() else {
                print("No image found")
                return
        }
        
        let activityVC = UIActivityViewController(activityItems: [imageData], applicationActivities: [])
        
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(activityVC, animated: true)
    }
}
