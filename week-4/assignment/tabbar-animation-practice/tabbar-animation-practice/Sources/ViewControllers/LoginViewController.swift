//
//  LoginViewController.swift
//  tabbar-animation-practice
//
//  Created by 초이 on 2020/11/13.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partTextField.delegate = self
        nameTextField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickLoginButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.mainStackView.transform = CGAffineTransform(translationX: 0, y: -50)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainStackView.transform = CGAffineTransform(translationX: 0, y: 0)
        nameTextField.endEditing(true)
        partTextField.endEditing(true)
        return true
    }
}
