//
//  ViewController.swift
//  collectionview-practice
//
//  Created by 초이 on 2020/11/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var peopleCollectionView: UICollectionView!
    @IBOutlet weak var writeBtn: UIButton!
    var peoples: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPeopleData()
        peopleCollectionView.dataSource = self
        peopleCollectionView.delegate = self
        
        self.writeBtn.layer.cornerRadius = 5
        self.writeBtn.clipsToBounds = true
    }
    
    func setPeopleData(){
        peoples.append(contentsOf: [
            People(name: "정초이", hashtag: "#안냐세요 #하이루 #안냐세용ㅋㅋㅋ #아요 #아용", imageName: "juhyeok"),
            People(name: "김초이", hashtag: "#안냐세요 #ㅎㅇㅎㅇ #안냐세용ㅋㅋㅋ #아요 #아용", imageName: "minguru"),
            People(name: "박초이", hashtag: "#ㅋㅋ #안녕 #안냐세용ㅋㅋㅋ #아요 #아용", imageName: "minju"),
            People(name: "최초이", hashtag: "#ㅎㅇ #안녕 #안냐세용ㅋㅋㅋ #아요 #아용", imageName: "peace"),
            People(name: "정초희", hashtag: "#안냐세요 #안녕 #안ㅎㅇㅎㅇ #아요 #아용", imageName: "heesoo"),
            People(name: "정초잉", hashtag: "#안냐세요 #안녕 #안냐세용ㅋㅋㅋ #ㅎㅇㅎㅇ #아용", imageName: "juhyeok"),
            People(name: "김초잉", hashtag: "#안냐세요 #안녕ㅎㅇ #안냐세용ㅋㅋㅋ #아요 #아ㅎㅇㅎㅇ", imageName: "heesoo")
        ])
    }
    


}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peoples.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
                    return UICollectionViewCell()
                }
        cell.setCell(people: peoples[indexPath.item])
                return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "collectionViewHeader", for: indexPath) as! CollectionReusableView
         
            return headerview
        }
}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 150, height: 225)
        
        }
        //Cell간 위아래 간격지정
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        //Cell간 좌우간격 지정
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 27
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 41, left: 24, bottom: 0, right: 24)
        }
}
