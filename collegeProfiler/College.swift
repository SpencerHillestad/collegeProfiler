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
    var webpage = ""
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "college")
    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage, WebPage: String)
    {
    super.init()
    name = Name
    location = Location
    numberOfStudents = NumberOfStudents
    image = Image
    webpage = WebPage
        
}
    init(Name: String, Location: String, WebPage: String)
{
    super.init()
    name = Name
    location = Location
    webpage = WebPage
}


}

