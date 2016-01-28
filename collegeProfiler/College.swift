//
//  College.swift
//  collegeProfiler
//
//  Created by shillestad on 1/21/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "college")
    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage)
    {
    super.init()
    name = Name
    location = Location
    numberOfStudents = NumberOfStudents
    image = Image
}
init(Name: String, Location: String)
{
    super.init()
    name = Name
    location = Location
}


}

