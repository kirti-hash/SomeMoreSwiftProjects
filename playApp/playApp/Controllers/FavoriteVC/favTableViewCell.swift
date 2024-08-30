//
//  favTableViewCell.swift
//  playApp
//
//  Created by Priya on 20/09/23.
//

import UIKit

class favTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var lblMusicName: UILabel!
    @IBOutlet weak var lblMusicGenre: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
