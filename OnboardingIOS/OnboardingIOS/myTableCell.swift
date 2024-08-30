//
//  myTableCell.swift
//  OnboardingIOS
//
//  Created by MRT102 on 19/10/23.
//

import UIKit

class myTableCell: UITableViewCell {

    @IBOutlet weak var myTxtVw: UITextView!
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
