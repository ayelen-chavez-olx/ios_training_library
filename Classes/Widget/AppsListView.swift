//
//  AppsListView.swift
//  Pods
//
//  Created by Ayelen Chavez on 16/01/2017.
//
//

import UIKit
import Kingfisher

public protocol AppListViewDelegate : NSObjectProtocol {
    func appClicked(app : App)
}

public class AppsListView: UIView, UITableViewDataSource, UITableViewDelegate {
    let table : UITableView
    var apps : [App]? {
        willSet {
            
        }
        didSet {
            //code
        }
    }
    weak var _delegate : AppListViewDelegate?
    public var delegate : AppListViewDelegate? {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    func start(apps: [App]) -> Void {
        // ui thread
        self.apps = apps
        self.table.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app : App = self.apps?[indexPath.row], let del = delegate {
            del.appClicked(app: app)
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell
        
        if let app : App = self.apps?[indexPath.row] {
            cell.mainAppLabel?.text = app.name
            let url = URL(string: app.iconURL)
            cell.rightImageView?.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, url) in
                    cell.setNeedsLayout()
                    cell.setNeedsDisplay()
            })
        }
        return cell
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myapps = apps {
            return myapps.count
        }
        
        return 0
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        table.frame = self.bounds
    }
    
    required public init?(coder aDecoder: NSCoder) {
        table = UITableView()
        
        super.init(coder: aDecoder)
        
        table.dataSource = self
        let bundle = Bundle(for: MyCustomTableViewCell.self)
        let nib = UINib(nibName: "MyCustomTableViewCell", bundle: bundle)
        table.register(nib, forCellReuseIdentifier: "cell")

        table.delegate = self
        self.addSubview(table)
        NetworkManager.instance.downloadContent { (apps) in
            DispatchQueue.main.async {
                self.start(apps: apps!)
            }
        }
    }
}
