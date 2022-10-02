//
//  ViewController.swift
//  tourist locations
//
//  Created by Kiki Pan on 10/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let locationNames = ["Space Needle", "Volunteer Park", "Discovery Park", "Pike Place Market", "Fremont Troll"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = Bundle.main.loadNibNamed("TouristCellTableViewCell", owner:self)?.first as! TouristCellTableViewCell
        cell.imgLoc.image = UIImage(named: locationNames[indexPath.row])
        cell.lblLoc.text = locationNames[indexPath.row]
        return cell
    }


}

