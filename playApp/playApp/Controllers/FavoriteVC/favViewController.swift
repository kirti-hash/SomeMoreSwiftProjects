//
//  favViewController.swift
//  playApp
//
//  Created by Priya on 20/09/23.
//

import UIKit

class favViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UITabBarDelegate{
    
    @IBOutlet weak var SegmentFav: UISegmentedControl!
    @IBOutlet weak var tblFavorite: UITableView!
    
    var boolSelect:Bool = true
    //MARK: Viewlifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        SegmentFav.setTitleTextAttributes(titleTextAttributes, for: .normal)
        SegmentFav.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        tblFavorite.register(UINib(nibName: "favTableViewCell", bundle: nil), forCellReuseIdentifier: "favCell")
        tblFavorite.register(UINib(nibName: "favArtistTableViewCell", bundle: nil), forCellReuseIdentifier: "favCellTwo")
        
    }
    
    //MARK: - UITableView Datasource And Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        if let tabBarController = self.tabBarController {
               tabBarController.selectedIndex = 0
           }
    }
  
    @IBAction func sementTap(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            boolSelect = true
            tblFavorite.reloadData()
        }else if(sender.selectedSegmentIndex == 1){
            boolSelect = false
            tblFavorite.reloadData()
        }else{
            print("none")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(boolSelect){
            let cell = tblFavorite.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! favTableViewCell
            tblFavorite.separatorStyle = .none
            return cell
        }else{
            let cell = tblFavorite.dequeueReusableCell(withIdentifier: "favCellTwo", for: indexPath) as! favArtistTableViewCell
            tblFavorite.separatorStyle = .singleLine
            return cell
        }
    }
}
