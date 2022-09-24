//
//  ViewController.swift
//  BasicTableViewController
//
//  Created by Kiki Pan on 9/24/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tblView: UITableView!
    
    let food = ["boba milktea","Ice Cream","Fried Chicken","Chesee Ball","Tiramisu","all kind of meats"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ojbk")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = food[indexPath.row]
        return cell
    }

}

