//
//  searchTableViewCell.swift
//  playApp
//
//  Created by Priya on 19/09/23.
//

import UIKit

class searchTableViewCell: UITableViewCell ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    @IBOutlet weak var collectionArtist: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionArtist.delegate = self
        collectionArtist.dataSource = self
        collectionArtist.register(UINib(nibName: "searchCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "artistCell")
        if let layout = collectionArtist.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    //MARK: collectionView Delegate and daasource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 80, height: 123)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionArtist.dequeueReusableCell(withReuseIdentifier: "artistCell", for: indexPath) as! searchCollectionViewCell
        return cell
    }
    
}
