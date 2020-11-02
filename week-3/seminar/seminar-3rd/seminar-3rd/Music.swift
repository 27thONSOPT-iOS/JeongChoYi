//
//  Music.swift
//  seminar-3rd
//
//  Created by 초이 on 2020/11/02.
//

import UIKit

struct Music{
    var title: String
    var singer: String
    var albumImageName: String
    
    func makeAlbumImage() -> UIImage?{
        return UIImage(named: albumImageName)
    }
}
