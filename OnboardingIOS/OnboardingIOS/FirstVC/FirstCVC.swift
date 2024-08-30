//
//  FirstCVC.swift
//  OnboardingIOS
//
//  Created by MRT102 on 17/10/23.
//

import UIKit

class FirstCVC: UICollectionViewCell ,UITableViewDataSource {
 
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var tblcontent: UITableView!
    
    var arrayHeader = [1, 1, 1, 1]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tblcontent.delegate = self
        tblcontent.dataSource = self
        tblcontent.register(UINib(nibName: "ContentTVC", bundle: nil), forCellReuseIdentifier: "ContentTVC")
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayHeader.count
    }
   
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(arrayHeader[section]) is always equal to 1
        return (self.arrayHeader[section] == 0) ? 0 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblcontent.dequeueReusableCell(withIdentifier: "ContentTVC", for: indexPath) as! ContentTVC
        cell.LblCell.text = "section: \(indexPath.section)  row: \(indexPath.row)"
        return cell
    }
    
}
extension FirstCVC:UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
     
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
            sectionButton.setTitle(String(section),for: .normal)
            sectionButton.backgroundColor = .systemBlue
            sectionButton.tag = section
            sectionButton.addTarget(self,action: #selector(self.tapSection(sender:)),for: .touchUpInside)
           return sectionButton
    }
  
    @objc func tapSection(sender: UIButton) {
            self.arrayHeader[sender.tag] = (self.arrayHeader[sender.tag] == 0) ? 1 : 0
            self.tblcontent.reloadSections([sender.tag], with: .fade)
          
        }
   
}
