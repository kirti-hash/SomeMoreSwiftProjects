//
//  TableVC.swift
//  SideMenuDemo
//
//  Created by MRT102 on 09/10/23.
//

import UIKit
import SideMenu
class TableVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var VwMenu: UIView!
    @IBOutlet weak var tblMenu: UITableView!
    
    var arrItems = ["Home","Profile","Wishlist","Saved Templates","Contact Info"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMenu.register(UINib(nibName: "MenuTVC", bundle: nil),forCellReuseIdentifier: "menuTVC")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMenu.dequeueReusableCell(withIdentifier: "menuTVC", for: indexPath) as! MenuTVC
        cell.LblMenu.text = arrItems[indexPath.row]
        return cell
    }



}
