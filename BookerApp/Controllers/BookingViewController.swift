//
//  HomeViewController.swift
//  BookerApp
//
//  Created by Ka ka Tam on 29/09/2018.
//  Copyright © 2018 Ka ka Tam. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var rooms : [Room] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initRooms()
    }
    
    func initRooms(){
        rooms.append(Room(name:"Room A", capacity:10, bookedBy:"test@test.com"))
        rooms.append(Room(name:"Room B", capacity:20, bookedBy:""))
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
        
        cell.textLabel?.text = rooms[indexPath.row].name
        
        return cell
    }
    
}
