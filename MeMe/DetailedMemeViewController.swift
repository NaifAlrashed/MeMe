//
//  DetailedMemeViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 2/8/17.
//  Copyright © 2017 Naif Alrashed. All rights reserved.
//

import UIKit

class DetailedMemeViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var theImage: UIImage!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        image.image = theImage
    }

}
