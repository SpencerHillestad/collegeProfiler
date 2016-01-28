//
//  DetailedViewController.swift
//  collegeProfiler
//
//  Created by shillestad on 1/26/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var studentsTF: UITextField!

    var colleges : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTF.text = colleges.name
        locationTF.text = colleges.location
        studentsTF.text = String(colleges.numberOfStudents)
        myImageView.image = colleges.image

    }

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        colleges.name = nameTF.text!
        colleges.location = locationTF.text!
        colleges.numberOfStudents = Int(studentsTF.text!)!
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailedViewController
    }

}
