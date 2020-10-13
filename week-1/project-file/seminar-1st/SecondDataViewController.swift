//
//  SecondDataViewController.swift
//  seminar-1st
//
//  Created by 초이 on 2020/10/10.
//

import UIKit

class SecondDataViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var updateStateLabel: UILabel!
    @IBOutlet weak var updateIntervalLabel: UILabel!
    
    var email: String?
    var isAutoUpdate: Bool?
    var updateInterval: Int?
    
    func setLabel() {
        // 옵셔널 바인딩
        // ,는 &&연산자와 같은 의미로 사용
        if let email = self.email,
           let isAutoUpdate = self.isAutoUpdate,
           let updateInterval = self.updateInterval {
            // Label에 값을 대입
            self.emailLabel.text = email
            self.emailLabel.sizeToFit()
            self.updateStateLabel.text = isAutoUpdate ? "On" : "Off"
            self.updateIntervalLabel.text = "\(updateInterval)분" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
