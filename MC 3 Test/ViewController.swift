//
//  ViewController.swift
//  MC 3 Test
//
//  Created by Rional Linardi on 23/08/19.
//  Copyright © 2019 Rional Linardi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var labelJudul: UILabel!
    
    @IBOutlet weak var isiJudul: UITextField!
    
    @IBOutlet weak var labelIsi: UILabel!
    
    @IBOutlet weak var isiIsi: UITextField!
    
    
    
    
    
    @IBOutlet weak var labelSearch: UILabel!
    
    
    @IBOutlet weak var isiSearch: UITextField!
    
    
   
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
   
    @IBAction func saveBtn(_ sender: UIButton) {
        
        if isiIsi?.text != "" && isiJudul?.text != "" {
            let newNote =  NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
            newNote.setValue(self.isiJudul.text, forKey: "judul")
            newNote.setValue(self.isiIsi.text, forKey: "isi")
            
            do{
                try context.save()
                
            } catch {
                print(error)
            }
            
        }
        else {
            print("Jangan kosong / error")
        }
    }
    
    
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
    }
    

}

