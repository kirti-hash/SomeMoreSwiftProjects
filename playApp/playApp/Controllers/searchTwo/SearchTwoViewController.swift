//
//  SearchTwoViewController.swift
//  playApp
//
//  Created by Priya on 19/09/23.
//

import UIKit

class SearchTwoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblSearch: UITableView!
    
    var arrStrSections = ["Recent Search","Recent Music"]
    let arrIntData = [["0,0"], ["1,0", "1,1", "1,2","1,3"]]
   
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSearch.register(UINib(nibName: "searchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchCellOne")
        tblSearch.register(UINib(nibName: "secondTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
    }
    
    //MARK: UIButton Actions
    @IBAction func backTap(_ sender: Any) {
        if let tabBarController = self.tabBarController {
               tabBarController.selectedIndex = 0
           }
    
    }
    
    //MARK: tableview delegate and Datasource
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrIntData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrStrSections[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        
        header.textLabel?.text = header.textLabel?.text?.capitalized
        header.textLabel?.font = UIFont.init(name: "Poppins", size: 20)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIntData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tblSearch.dequeueReusableCell(withIdentifier: "searchCellOne", for: indexPath) as! searchTableViewCell
            return cell
        }else{
            let cell = tblSearch.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! secondTableViewCell
            return cell
        }
    }
}
