//
//  DetailViewController.swift
//  AlamoFireDemo
//
//  Created by AMAN JAIN on 31/10/18.
//  Copyright © 2018 PayTm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    
     var textDetail: String = ""
    var phoneNumber: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtLbl.text = textDetail
        phoneNum.text = phoneNumber
    }
}
