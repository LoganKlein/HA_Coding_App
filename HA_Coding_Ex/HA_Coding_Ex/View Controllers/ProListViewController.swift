//
//  ProListViewController.swift
//  HA_Coding_Ex
//
//  Created by Logan Klein on 11/7/20.
//

import UIKit

class ProListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pros"
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let pro = sender as? Pro
            (segue.destination as? ProDetailViewController)?.pro = pro
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension ProListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataLoader.shared().pros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pro = DataLoader.shared().pros[indexPath.row]
        let cell = (tableView.dequeueReusableCell(withIdentifier: "proCellId", for: indexPath)) as! ProCell
        cell.setup(with: pro)
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension ProListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let pro = DataLoader.shared().pros[indexPath.row]
        self.performSegue(withIdentifier: "goToDetail", sender: pro)
    }
}
