//
//  DetailViewController.swift
//  Storm-Viewer
//
//  Created by Mayuresh Rao on 8/15/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var totalNumberOfImages: Int?
    var currentImageIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        if let total = totalNumberOfImages, let current = currentImageIndex {
        title = "(\(current)/\(total))"
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        }
        navigationItem.largeTitleDisplayMode =
            .never
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8),  let imageText = selectedImage else {
            print("No image found")
            return
        }
        // In the UIActivityController activity items contains the items to be shared.
        // The ApplicationActivities we need to pass the app services.
        let vc = UIActivityViewController(activityItems: [image, imageText], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated:true)
    }
}
