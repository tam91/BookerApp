//
//  HomeViewController.swift
//  BookerApp
//
//  Created by Ka ka Tam on 29/09/2018.
//  Copyright © 2018 Ka ka Tam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var activities : [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activities = [Activity.Badminton, Activity.Basketball, Activity.Judo, Activity.Soccer, Activity.Squash, Activity.Taekwondo, Activity.Tennis, Activity.Volleyball]
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        var currentValue = Int(sender.value)
        print("Slider changing to \(currentValue) ?")
        DispatchQueue.main.async {
            self.durationLabel.text = "\(currentValue) hours"
        }
    }
    @IBAction func searchPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        var selectedDate = dateFormatter.string(from: datePicker.date)
        print("selectedDate",selectedDate)
        let requestedComponents: Set<Calendar.Component> = [
            .day,
            .hour
        ]
        let calendar = datePicker.calendar!
        let dateTimeComponents = calendar.dateComponents(requestedComponents, from: datePicker.date)
        print(dateTimeComponents.hour)
        performSegue(withIdentifier: "goToBooking", sender: self)
    }
    
    // MARK: tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        let activity = activities[indexPath.row].rawValue
        cell.textLabel?.text = activity
        
        return cell
    }
    

    

    
}
