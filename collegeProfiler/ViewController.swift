//
//  ViewController.swift
//  collegeProfiler
//
//  Created by shillestad on 1/20/16.
//  Copyright © 2016 shillestad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
    
{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges = [College]()
    var myPhotos : [UIImage] = []

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        editButton.tag = 0
        
        
        colleges.append(College(Name: "The University of Iowa", Location: "Iowa City, IA 52242", NumberOfStudents: 31387, Image: UIImage(named: "iowa")! ,WebPage: "uiowa.edu/"))
        colleges.append(College(Name: "The University of Michigan", Location: "500 S State St, Ann Arbor, MI 48109", NumberOfStudents: 43651, Image: UIImage(named: "michigan")! ,WebPage: "umich.edu/"))
        colleges.append(College(Name: "University of Missouri", Location: "Columbia, MO 65211", NumberOfStudents: 35441, Image: UIImage(named: "mizzou")! ,WebPage : "missouri.edu/"))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            //reload tableview data
            myTableView.reloadData()
        }
    }

    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //Sets properties of cell text
        myCell.textLabel?.text = colleges[indexPath.row].name
        myCell.detailTextLabel?.text = colleges[indexPath.row].location
        
        return myCell

    }
   
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{ (nameTextField) -> Void in
            nameTextField.placeholder = "Add College Name!"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (nameAilasField) -> Void in
            nameAilasField.placeholder = "Add Location!"
        }
        
        myAlert.addTextFieldWithConfigurationHandler{ (nameAilasField) -> Void in
            nameAilasField.placeholder = "Number of Students"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (webSiteTF) -> Void in
            webSiteTF.placeholder = "Webpage"
        }
        
        
        let cancelAction = UIAlertAction(title: "Canel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let locationTF = myAlert.textFields![0] as UITextField
            let nameTF = myAlert.textFields![1] as UITextField
            let  studentTF = myAlert.textFields![2] as UITextField
            let  webSiteTF = myAlert.textFields![3] as UITextField


            self.colleges.append(College(Name: nameTF.text!, Location: locationTF.text! ,WebPage: webSiteTF.text!))
            self.myTableView.reloadData()

        }
        myAlert.addAction(addAction)
        
        //presents alertview
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func editButtonTapped(sender: AnyObject)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1

        }
        else
        {
            self.myTableView.editing = false
            self.editButton.tag = 0
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailedViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.colleges = colleges[selectedRow!]
    }
    
    
      


}

