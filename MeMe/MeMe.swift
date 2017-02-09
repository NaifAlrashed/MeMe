//
//  File.swift
//  MeMe
//
//  Created by Naif Alrashed on 12/22/16.
//  Copyright © 2016 Naif Alrashed. All rights reserved.
//

import UIKit

class MeMe {
    let topText: String
    let bottomText: String
    let originalImage: UIImage
    let memedImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
}
