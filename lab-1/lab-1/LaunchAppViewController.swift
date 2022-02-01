//
//  LaunchAppViewController.swift
//  lab-1
//
//  Created by Jess Ryan on 1/31/22.
//

import UIKit

class LaunchAppViewController: UIViewController {

    @IBAction func launchCalendar(_ sender: Any) {
    
        
        if (UIApplication.shared.canOpenURL(URL(string: "x-apple-health://")!)){
           UIApplication.shared.open(URL(string: "x-apple-health://")!, options: [:], completionHandler: nil)
        } else {
            
                UIApplication.shared.open(URL(string: "http://www.apple.com/health/" )! , options: [:], completionHandler: nil)
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
