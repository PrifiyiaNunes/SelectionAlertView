//
//  MainController.swift
//  SelectionAlertView
//
//  Created by Prifiyia on 30/05/22.
//

import UIKit

class MainController: UIViewController {
    var data = [["key": "", "value": ""], ["value": "Demo", "key": "Demo"], ["value": "Existing", "key": "Existing"], ["key": "Feature Request", "value": "Feature Request"], ["value": "Feedback", "key": "Feedback"], ["key": "New Installation", "value": "New Installation"], ["key": "NRF Demo", "value": "NRF Demo"], ["key": "Problem", "value": "Problem"], ["value": "Log", "key": "Log"], ["key": "AMC", "value": "AMC"], ["key": "Warranty", "value": "Warranty value"], ["key": "Paid", "value": "Paid"], ["value": "value", "key": "key"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAlertClicked(_ sender: UIButton) {
        showCheckBoxPopup(topHeading: "Customer Type", arr_DefaultSelected: data, arrData: data)
    }
}

