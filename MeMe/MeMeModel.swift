//
//  File.swift
//  MeMe
//
//  Created by Naif Alrashed on 12/22/16.
//  Copyright © 2016 Naif Alrashed. All rights reserved.
//

import UIKit

class MeMeModel {
    
    struct MeMe {
        let topText: String
        let bottomText: String
        let originalImage: UIImage
        let memedImage: UIImage
    }
    
    func getMeMeInstance(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) -> MeMe {
        return MeMe (topText: topText, bottomText: bottomText, originalImage: originalImage, memedImage: memedImage)
    }
}
