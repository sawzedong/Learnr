//
//  SubjectDetailTableViewController.swift
//  Learnr
//
//  Created by Shaw Sheng Saw on 20/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit

class SubjectDetailTableViewControllerDeprecated: UITableViewController {

    var subject: Subject!
    var focusedCompletion: completionStatus = .overdue
    var focusedAssignments: [Assignment] = []
    
    // to change the viewed cells, change the focusedCompletion value and call the loadData() function
    func loadData() {
        for assignment in subject.assignments {
            assignment.updateCompletion()
            print(assignment.completeStatus)
        }
        focusedAssignments = subject.assignments.filter { $0.completeStatus == focusedCompletion }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = subject.name
        loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //can try changing to 2 then editing the first section to include the stuff on overdue; finished and unfinished -vicky
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return focusedAssignments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentCell", for: indexPath)

        if let cell = cell as? SubjectDetailTableViewCell {
            let currentSubject = focusedAssignments[indexPath.row]
            cell.progressView.progress = Float(currentSubject.completion)
            cell.completionLabel.text = "\(Int(round(currentSubject.completion * 100)))%"
            cell.dueDateLabel.text = currentSubject.getStringDate()
            cell.homeworkNameLabel.text = currentSubject.name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
