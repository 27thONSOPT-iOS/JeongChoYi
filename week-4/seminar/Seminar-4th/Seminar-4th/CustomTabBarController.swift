//
//  CustomTabBarController.swift
//  Seminar-4th
//
//  Created by 초이 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTabs()
    }
    
    func setTabs(){
        guard let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowVC") as? YellowVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
        else{
            return
        }
        
        yellowVC.tabBarItem.title = "YELLOW"
        yellowVC.tabBarItem.image = UIImage(systemName: "house")
        yellowVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        blueVC.tabBarItem.title = "BLUE"
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([yellowVC, blueVC], animated: true)
    }
}
