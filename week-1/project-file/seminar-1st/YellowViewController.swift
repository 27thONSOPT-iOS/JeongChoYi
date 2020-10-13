//
//  YellowViewController.swift
//  seminar-1st
//
//  Created by 초이 on 2020/10/10.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClose(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        //present에만 해당됨
        //present로 띄운 view를 없애는 메소드
        
        self.navigationController?.popViewController(animated: true)
        //네비게이션스택의 최상의 뷰컨트롤러 없애줌
    }

}
