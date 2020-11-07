//
//  ProDetailViewController.swift
//  HA_Coding_Ex
//
//  Created by Logan Klein on 11/7/20.
//

import UIKit

class ProDetailViewController: UIViewController {
    
    @IBOutlet var proNameLbl: UILabel!
    @IBOutlet var proSpecialtyLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var servicesLbl: UILabel!
    @IBOutlet var overviewTV: UITextView!
    
    var pro: Pro?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details"
        
        proNameLbl.text = pro?.companyName
        proSpecialtyLbl.text = pro?.specialty
        ratingLbl.text = pro?.ratingText
        locationLbl.text = pro?.primaryLocation
        servicesLbl.text = pro?.servicesOffered
        overviewTV.text = pro?.companyOverview
    }
    
    // MARK: - IBActions
    
    @IBAction func callPressed() {
        guard let phoneNumber = pro?.phoneNumber else {
            print("Unable to find phone number")
            return
        }
        
        print("phone = \(phoneNumber)")
    }
    
    @IBAction func emailPressed() {
        guard let email = pro?.email else {
            print("Unable to find email")
            return
        }
        
        print("email = \(email)")
        
    }
}
