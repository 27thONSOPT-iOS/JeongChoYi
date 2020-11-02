//
//  PartBannerCell.swift
//  seminar-3rd
//
//  Created by 초이 on 2020/11/02.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    static let identifier = "PartBannerCell"
    
    @IBOutlet weak var partImageView: UIImageView!
    
    func setImage(imageName: String){
        partImageView.image = UIImage(named: imageName)
    }
}
