//
//  NotesViewController.swift
//  MC 3 Test
//
//  Created by Rional Linardi on 23/08/19.
//  Copyright © 2019 Rional Linardi. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    
    @IBOutlet weak var notesView: UITableView!
    
    var NoteArray:[Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesView.delegate = self
        notesView.dataSource = self
        self.fetchData()
        self.notesView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return NoteArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = NoteArray[indexPath.row]
        cell.textLabel!.text = name.judul! + " " + name.isi!
        
        return cell
    }
    
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            NoteArray = try context.fetch (Note.fetchRequest())
        } catch {
            print (error)
        }
        
    }
    
}
