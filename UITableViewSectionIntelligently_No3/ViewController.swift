//
//  ViewController.swift
//  UITableViewSectionIntelligently_No3
//
//  Created by masato on 12/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellId = "cellId"

    let names = [
        "Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mike"
    ]

    let anotherListOfNames = [
        "Carl", "Chris", "Christina", "Cameron"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }


    // set Section Label
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = .orange
        return label
    }

    // Number of Section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


    // how many Cells row Set to Cell Row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return names.count
        }
        return anotherListOfNames.count
    }


    // dequeque cell (deque process needs to tableView.register process)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)


        // cell
        let name = indexPath.section == 0 ? names[indexPath.row] : anotherListOfNames[indexPath.row]

        cell.textLabel?.text = name

        cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row:\(indexPath.row)"

        return cell


    }


}

