//
//  homeViewController.swift
//  playApp
//
//  Created by Priya on 18/09/23.
//

import UIKit

class homeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CollectionMusic: UICollectionView!
    @IBOutlet weak var CollectionLiveMusic: UICollectionView!
    @IBOutlet weak var CollectionRecentMusic: UICollectionView!
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: collection View delegate and datasource
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == CollectionMusic){
        return CGSize(width: 100, height: 300)
        }else if (collectionView == CollectionLiveMusic){
            return CGSize(width: 296, height: 350)
        }else {
            return CGSize(width: 315, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == CollectionMusic){
            let cell = CollectionMusic.dequeueReusableCell(withReuseIdentifier: "collCellOne", for: indexPath)
            return cell
        }else if(collectionView == CollectionLiveMusic){
            let cell = CollectionLiveMusic.dequeueReusableCell(withReuseIdentifier: "collCellTwo", for: indexPath)
            return cell
        }else {
            let cell = CollectionRecentMusic.dequeueReusableCell(withReuseIdentifier: "collCellThree", for: indexPath)
            return cell
        }
    }
}
