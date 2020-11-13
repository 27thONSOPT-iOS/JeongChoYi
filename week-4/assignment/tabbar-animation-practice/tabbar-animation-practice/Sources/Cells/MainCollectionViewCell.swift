//
//  MainCollectionViewCell.swift
//  collectionview-practice
//
//  Created by 초이 on 2020/11/06.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hashtagLabel: UILabel!
    
    func setImage(imageName: String){
            imageView.image = UIImage(named: imageName)
        }
    
    func setCell(people: People){
        imageView.image = people.makeImage()
        nameLabel.text = people.name
        hashtagLabel.text = people.hashtag
    }
    
}
