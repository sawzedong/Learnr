//
//  placeholderForTestingViewController.swift
//  Learnr
//
//  Created by Apple on 22/9/20.
//  Copyright © 2020 Techiaki. All rights reserved.
//

import UIKit

class SubjectDetailTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var subject: Subject!
    var focusedCompletion: completionStatus = .overdue
    var focusedAssignments: [Assignment] = []
    
    @IBOutlet weak var tabSelection: UISegmentedControl!
    @IBOutlet var assignmentsTableView: UITableView!
    
    func loadData() {
        for assignment in subject.assignments {
            assignment.updateCompletion()
        }
        focusedAssignments = subject.assignments.filter { $0.getCompletionStatus() == focusedCompletion }
        
        self.assignmentsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignmentsTableView.delegate = self
        assignmentsTableView.dataSource = self
        self.title = subject.name
        loadData()
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return focusedAssignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectAssignmentCell", for: indexPath)

        if let cell = cell as? SubjectDetailTableViewCell {
            let currentSubject = focusedAssignments[indexPath.row]
            cell.progressView.progress = Float(currentSubject.completion)
            cell.completionLabel.text = "\(Int(round(currentSubject.completion * 100)))%"
            cell.dueDateLabel.text = currentSubject.getStringDate()
            cell.homeworkNameLabel.text = currentSubject.name
            
            if currentSubject.getCompletionStatus() == .complete {
                cell.progressView.tintColor = .systemGreen
            } else {
                cell.progressView.tintColor = .systemRed
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tabSelectionValueChange(_ sender: Any) {
        let current = tabSelection.selectedSegmentIndex

        if (current == 0) {
            focusedCompletion = .overdue
        } else if (current == 1) {
            focusedCompletion = .incomplete
        } else if (current == 2) {
            focusedCompletion = .complete
        }
        
        loadData()
    }
    
}


/*categorySelection.setTitleTextAttributes([
    NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18),
    NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)*/

/*here's the link: https://www.codementor.io/@kevinfarst/designing-a-button-bar-style-uisegmentedcontrol-in-swift-cg6cf0dok
 
    https://medium.com/code-with-coffee/create-a-custom-segmented-control-6488400f8705
 */
