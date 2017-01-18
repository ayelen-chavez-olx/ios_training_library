//
//  DetailViewController.swift
//  Example
//
//  Created by Ayelen Chavez on 18/01/2017.
//  Copyright © 2017 Ayelen Chavez. All rights reserved.
//

import UIKit
import ios_training_library
import StoreKit
import SafariServices

class DetailViewController: UIViewController, SKStoreProductViewControllerDelegate {
    var app : App? {
        didSet {
            if (didLoad) {
                refreshUI()
            }
        }
    }
    var didLoad = false
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var bundleIdLabel: UILabel!
    @IBOutlet weak var appleIDLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appstoreButton: UIButton!
    let appStoreBaseUrl : String = "https://itunes.apple.com/app/id"
    
    @IBAction func appStoreButtonClicked(_ sender: Any) {
        if let myapp = app {
            // open a web view
//            let appStoreUrl = appStoreBaseUrl + myapp.appleID
//            
//            if let url = URL(string: appStoreUrl) {
//                let viewController = SFSafariViewController(url: url)
//                self.navigationController?.pushViewController(viewController, animated: true)
//            }
//            
            // open app store
            let viewController = SKStoreProductViewController()
            viewController.delegate = self

            if let appid = Int(myapp.appleID) {
                let id = NSNumber(value: appid)
                let params = [SKStoreProductParameterITunesItemIdentifier:id]
                viewController.loadProduct(withParameters: params, completionBlock: { (loaded, error) in
                    if (loaded) {
                        // this could happen any time
                        self.present(viewController, animated: true, completion: nil)
                    }
                })
            }
            
            // let the system manage the url
//            let appStoreUrl = appStoreBaseUrl + myapp.appleID
//            if let url = URL(string: appStoreUrl) {
//                if #available(iOS 10.0, *) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                } else {
//                    // Fallback on earlier versions
//                    UIApplication.shared.openURL(url)
//                }
//            }
        }
    }
    
    public func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad = true
        refreshUI()
        
        // Do any additional setup after loading the view.
    }
    
    func refreshUI() {
        if let myapp = app {
            appNameLabel.text = myapp.name
            bundleIdLabel.text = myapp.bundleID
            appleIDLabel.text = myapp.appleID
            appImageView.kf.setImage(with: URL(string: myapp.iconURL))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        appNameLabel÷
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
