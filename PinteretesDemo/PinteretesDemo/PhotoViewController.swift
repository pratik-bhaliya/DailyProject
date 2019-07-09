//
//  PhotoViewController.swift
//  PinteretesDemo
//
//  Created by Pratik Bhaliya on 9/7/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var detailPicture: UIImageView!
    var img: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailPicture.image = img
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
