//
//  ViewController.swift
//  Storm-Viewer
//
//  Created by Mayuresh Rao on 8/14/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                // load the photo
                pictures.append(item)
            }
        }
        print(pictures)
        pictures.sort(by: <)
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController? {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalNumberOfImages = pictures.count
            vc.currentImageIndex = indexPath.row + 1
           // var totalNumberOfImages: Int?
           //   var currentImageIndex: Int?
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

