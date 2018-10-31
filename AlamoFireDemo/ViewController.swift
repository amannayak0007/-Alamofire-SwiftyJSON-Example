//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by AMAN JAIN on 30/10/18.
//  Copyright © 2018 PayTm. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        nextVC.textDetail = arrRes[indexPath.row]["address"] as? String ?? ""
        if let phone = arrRes[indexPath.row]["phone"]{
            nextVC.phoneNumber  = phone["mobile"] as? String ?? ""
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

