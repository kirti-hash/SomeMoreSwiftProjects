//
//  favArtistTableViewCell.swift
//  playApp
//
//  Created by Priya on 20/09/23.
//

import UIKit

class favArtistTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgArtistIcon: UIImageView!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblArtistGenre: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
