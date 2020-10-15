//
//  ViewController.swift
//  practice-present-push-pop
//
//  Created by 초이 on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goLogin(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") else {
             return
        }
        self.present(dvc, animated: true, completion: nil)
    }
    
}

