//
//  FirstDataViewController.swift
//  seminar-1st
//
//  Created by 초이 on 2020/10/10.
//

import UIKit

class FirstDataViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var updateStateLabel: UILabel!
    @IBOutlet weak var updateIntervalLabel: UILabel!
    @IBOutlet weak var updateStateSwitch: UISwitch!
    @IBOutlet weak var updateIntervalStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChangedSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            self.updateStateLabel.text = "자동 갱신"
        }else{
            self.updateStateLabel.text = "수동 갱신"
        }
        
    }
    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        updateIntervalLabel.text = "\(Int(sender.value)) 분 마다"
    }
    @IBAction func touchUpSubmit(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier:
        "SecondDataViewController") as? SecondDataViewController else {
            return
        }
        // 결과 화면에 데이터를 전달
        dvc.email = self.emailTextField.text
        dvc.isAutoUpdate = self.updateStateSwitch.isOn
        dvc.updateInterval = Int(self.updateIntervalStepper.value)
        // modal 스타일 변경
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
        //as로 타입캐스팅
        //위에는 guard-let으로 빠른종료를 했지만
        //아래는 if-let 써서 dvc는 guard 내부에서만 사용하는 것
        
        if let dvc = self.storyboard?.instantiateViewController(identifier: "SecondDataViewController") as? SecondDataViewController {
            // 결과 화면에 데이터를 전달
            dvc.email = self.emailTextField.text
            dvc.isAutoUpdate = self.updateStateSwitch.isOn
            dvc.updateInterval = Int(self.updateIntervalStepper.value)
            self.present(dvc, animated: true, completion: nil)
        }
    }
    
}
