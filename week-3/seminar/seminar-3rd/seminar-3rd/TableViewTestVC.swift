//
//  TableViewTestVC.swift
//  seminar-3rd
//
//  Created by 초이 on 2020/11/02.
//

import UIKit

class TableViewTestVC: UIViewController {
    @IBOutlet weak var musicRankTableVIew: UITableView!
    
    var musicRank: [Music] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setMusicData()
        musicRankTableVIew.delegate = self
        musicRankTableVIew.dataSource = self
    }
    
    func setMusicData(){
        musicRank.append(contentsOf: [
            Music(title: "Lovesick Girls", singer: "BLACK PINK", albumImageName: "blackpink"),
            Music(title: "Dynamite", singer: "방탄소년단", albumImageName: "bts"),
            Music(title: "positions", singer: "Ariana Grande", albumImageName: "ariana"),
            Music(title: "놓아줘 (with 태연)", singer: "크러쉬", albumImageName: "crush"),
            Music(title: "I CAN'T STOP ME", singer: "TWICE", albumImageName: "twice"),
            Music(title: "Make A Wish (Birthday Song)", singer: "NCT U", albumImageName: "nctu"),
            Music(title: "ALIEN", singer: "이수현", albumImageName: "leesuhyeon"),
            Music(title: "DON'T TOUCH ME", singer: "환불원정대", albumImageName: "hwanbool"),
            Music(title: "Pretty Savage", singer: "BLACKPINK", albumImageName: "blackpink"),
            Music(title: "Bet You Wanna (feat. Cardi B)", singer: "BLACKPINK", albumImageName: "blackpink")
        ])
    }

}

extension TableViewTestVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicRankCell.identifier) as? MusicRankCell else {
            return UITableViewCell()
        }
        cell.setCell(rank: indexPath.row, music: musicRank[indexPath.row])
        return cell
    }
}

extension TableViewTestVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMusic = musicRank[indexPath.row]
        if let dvc = self.storyboard?.instantiateViewController(identifier: "MusicInfoVC") as? MusicInfoVC {
            dvc.music = selectedMusic
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
}
