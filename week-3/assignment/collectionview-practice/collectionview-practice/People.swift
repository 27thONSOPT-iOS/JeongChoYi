//
//  People.swift
//  collectionview-practice
//
//  Created by 초이 on 2020/11/06.
//

import UIKit
struct People{
    var name: String
    var hashtag: String
    var imageName: String
    
    func makeImage() -> UIImage?{
        return UIImage(named: imageName)
    }
}
