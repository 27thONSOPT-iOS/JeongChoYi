//
//  SignUpViewController.swift
//  practice-present-push-pop
//
//  Created by 초이 on 2020/10/15.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popSignUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
