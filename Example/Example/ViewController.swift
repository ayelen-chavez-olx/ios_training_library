//
//  ViewController.swift
//  Example
//
//  Created by Ayelen Chavez on 16/01/2017.
//  Copyright © 2017 Ayelen Chavez. All rights reserved.
//

import UIKit
import ios_training_library

class ViewController: UIViewController, AppListViewDelegate {
    @IBOutlet weak var appListView : AppsListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appListView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func appClicked(app : App) {
        print(app.name)
        if let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.app = app
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

