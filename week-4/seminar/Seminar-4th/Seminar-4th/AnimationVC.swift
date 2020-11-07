//
//  AnimationVC.swift
//  Seminar-4th
//
//  Created by 초이 on 2020/11/07.
//

import UIKit

class AnimationVC: UIViewController {
    @IBOutlet weak var cowImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func initPosition(){
        cowImageView.frame = CGRect(x: 87, y: 127, width: 240, height: 240)
    }
    
    @IBAction func pressStartBtn(_ sender: Any) {
//        UIView.animate(withDuration: 2.0, animations: {
//            self.cowImageView.alpha = 0
//        })
//
//        let newPosition = CGRect(x: 0, y: 0, width: 240, height: 240)
//
//        UIView.animate(withDuration: 1.0, animations: {
//            self.cowImageView.alpha = 0
//            self.cowImageView.frame = newPosition
//        }) { finished in //finished에 animation이 끝났는지 아닌지를 bool값으로 받아옴. finished 대신 (finish) 이런 식으로 써도 됨
//            UIView.animate(withDuration: 1.0, animations: {//completion 내에도 애니메이션 사용 가능 - 꼬리에 꼬리를 무는 animation 구현 가능
//                self.cowImageView.alpha = 1
//                self.initPosition()
//            }) { (finish) in
//                if finish {
//                    print("FINISH!!!")//모든 애니메이션 끝나면 출력
//                }
//            }
//        }
        
//        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .curveEaseIn) {
//            self.cowImageView.alpha = 0
//            self.cowImageView.frame = newPosition
//        } completion: { (finish) in
//            self.cowImageView.alpha = 1
//            self.initPosition()
//        }
//
        //frame을 옮기는 방식은 오토레이아웃 잡으면 제대로 동작 안해서 affine으로 하는게 좋을 수 있다.
        
        UIView.animate(withDuration: 2.0) {
            //self.cowImageView.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
            //현재값에 얼마를 곱할건지 지정
            //self.cowImageView.transform = CGAffineTransform(translationX: 100, y: 100)
            //현재 x,y좌표에서 이동을 얼마나 시킬건지 지정
            //self.cowImageView.transform = CGAffineTransform(rotationAngle: .pi)
            //현재 각도에서 회전을 얼마만큼 시킬건지 지정
            
            //concatenating 을 통해 한번에 실행하기
            let scale = CGAffineTransform(scaleX: 2.0, y: 0.5)
            let rotate = CGAffineTransform(rotationAngle: .pi)
            let move = CGAffineTransform(translationX: 100, y: 100)
            
            let combine = scale.concatenating(move).concatenating(rotate).concatenating(move)
            
            UIView.animate(withDuration: 1.0, delay: 0) {
                self.cowImageView.transform = combine
            } completion: { finished in
                UIView.animate(withDuration: 1.0) {
                    // .identity 속성 사용해서 모든 변환을 제거하기
                    self.cowImageView.transform = .identity
                }
            }

            
            
        }
    }
}
