//
//  ViewController.swift
//  seminar-1st
//
//  Created by 초이 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpClick(_ sender: Any) {
        helloLabel.text = "Hello On SOPT!"
        helloLabel.sizeToFit()
        
    }
    @IBAction func touchUpPresent(_ sender: Any) {
//        guard let dvc = self.storyboard?.instantiateViewController(identifier: "YellowViewController") else {
//            return
//        }
//        self.present(dvc, animated: true, completion: nil)
        //위 내용 : present modal code로 구현하기 내용
        //navigation bar 구현 위해 주석처리
        //segue랑 IBAction이 중첩되면 두개가 실행되기 때문에 하나를 지워줘야 함
        
        //code로 push 구현하기
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "YellowViewController") else{
            return
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}

