//
//  DetailedViewController.swift
//  collegeProfiler
//
//  Created by shillestad on 1/26/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit
import SafariServices

class DetailedViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var studentsTF: UITextField!
    @IBOutlet weak var webSiteTF: UITextField!

    var colleges : College!
    let myImagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myImagePicker.delegate = self
        
        nameTF.text = colleges.name
        locationTF.text = colleges.location
        studentsTF.text = String(colleges.numberOfStudents)
        myImageView.image = colleges.image
        webSiteTF.text = colleges.webpage
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
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonTapped(sender: AnyObject)
    {
        let myURL = NSURL(string: "https://\(colleges.webpage)")
        let SVC = SFSafariViewController(URL: myURL!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)

    }
    
    @IBAction func cameraButtonTapped(sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(myImagePicker, animated: true, completion: nil)
        }
        else
        {
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(self.myImagePicker, animated: true, completion: nil)
        }

    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
    }


}
}