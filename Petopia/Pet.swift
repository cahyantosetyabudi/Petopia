//
//  Pet.swift
//  Petopia
//
//  Created by Cahyanto Setya Budi on 8/15/16.
//  Copyright © 2016 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class Pet {
    var name: String
    var type: String
    var description: String
    var photo: UIImage
    
    init(name: String, type: String, description: String, photo: UIImage){
        self.name = name
        self.type = type
        self.description = description
        self.photo = photo
    }
    
}