//
//  secondTableViewCell.swift
//  playApp
//
//  Created by Priya on 19/09/23.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
