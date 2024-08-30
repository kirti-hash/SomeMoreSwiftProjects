//
//  profileViewController.swift
//  playApp
//
//  Created by Priya on 19/09/23.
//

import UIKit

class profileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tblSettings: UITableView!
    
    var arrStrItems = ["Account","Data Saver","Language","Playlist","Change Password"]
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblSettings.register(UINib(nibName: "settingsTableViewCell", bundle: nil), forCellReuseIdentifier: "settingsCell")
    }
    
    //MARK: UIButtons Actions
    
    @IBAction func logOutBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        if let tabBarController = self.tabBarController {
               tabBarController.selectedIndex = 0
           }
    }
    
    //MARK: tableview delegate and datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSettings.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingsTableViewCell
        cell.lblCell.text = arrStrItems[indexPath.row]
        return cell
    }
    
}
