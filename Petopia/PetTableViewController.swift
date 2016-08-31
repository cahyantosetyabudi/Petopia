//
//  PetTableViewController.swift
//  Petopia
//
//  Created by Cahyanto Setya Budi on 8/15/16.
//  Copyright © 2016 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
class PetTableViewController: UITableViewController {
    var pets = [Pet]()
    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPets()
    }
    
    func loadPets() {
        var photo1 = UIImage(named: "cat")
        var photo2 = UIImage(named: "dog")
        
        var pet1 = Pet(name: "Ebru", type: "Cat", description: "Kucing Pemalas", photo: photo1!)
        var pet2 = Pet(name: "Dogz", type: "Dog", description: "Anjing Pemalas", photo: photo2!)
        
        pets += [pet1,pet2]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? PetTableViewCell
        let pet = pets[indexPath.row]
        cell?.petNameLabel.text = pet.name
        cell?.petTypeLabel.text = pet.type
        cell?.petDescriptionLabel.text = pet.description
        cell?.petPhotoImageView.image = pet.photo
        return cell!
        
    }
    
    @IBAction func unwindToPetList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? PetViewController, pet = sourceViewController.pet {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                pets[selectedIndexPath.row] = pet
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Automatic)
            } else {
                let newIndexPath = NSIndexPath(forRow: pets.count, inSection: 0)
                pets.append(pet)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let destinationViewController = segue.destinationViewController as? PetViewController{
                if let selectedPetCell = sender as? PetTableViewCell{
                    let indexPath = tableView.indexPathForCell(selectedPetCell)!
                    let selectedPet = pets[indexPath.row]
                    destinationViewController.pet = selectedPet
                }
            }
        }
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            pets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        }
    }
}
