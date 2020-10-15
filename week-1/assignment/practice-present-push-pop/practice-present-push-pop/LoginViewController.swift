//
//  LoginViewController.swift
//  practice-present-push-pop
//
//  Created by 초이 on 2020/10/15.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pushSignUp(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") else {
            return
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
