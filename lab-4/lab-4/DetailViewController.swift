//
//  DetailViewController.swift
//  lab-4
//
//  Created by Jess Ryan on 2/22/22.
//

import UIKit

class DetailViewController: UIViewController {
    var imageName: String?

    @IBAction func shareButton(_ sender: Any) {
        var imageArray = [UIImage]()
                imageArray.append(imageView.image!)
                let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
                shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender as! UIBarButtonItem
                present(shareScreen, animated: true, completion: nil)
            
    }
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName{
            imageView.image = UIImage(named: name)
        }
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
