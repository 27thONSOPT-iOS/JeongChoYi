//
//  MusicInfoVC.swift
//  seminar-3rd
//
//  Created by 초이 on 2020/11/02.
//

import UIKit

class MusicInfoVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setMusicInfo()
    }
    
    func setMusicInfo(){
        if let music = music {
            titleLabel.text = music.title
            singerLabel.text = music.singer
            albumImageView.image = music.makeAlbumImage()
        }
    }

}
