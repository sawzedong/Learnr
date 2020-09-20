import UIKit
class SubjectsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "subjectCell"
    
    // placeholder items
    var items: [Subject] = [
        Subject(name: "1", assignments: [
            Assignment(name: "Homework1", completion: 0.5, timeIntervalSince1970: 1600582389),
            Assignment(name: "Homework2", completion: 0.7, timeIntervalSince1970: 1600585389),
            Assignment(name: "Homework3", completion: 0.3, timeIntervalSince1970: 1600588389),
        ]),
        Subject(name: "2", assignments: []),
        Subject(name: "3", assignments: []),
        Subject(name: "4", assignments: []),
        Subject(name: "5", assignments: [])
    ]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // number of cells in collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    // make a cell for each cell index path
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SubjectsCollectionViewCell
        cell.subjectLabel.text = self.items[indexPath.row].name
        cell.backgroundColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 0.3, brightness: 1, alpha: 1)
        
        //for shadow and outline - Vicky
        //cell.layer.shadowColor = UIColor.black.cgColor
        
        //cell.layer.shadowOpacity = 0.5
        
        //cell.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        
        //cell.layer.shadowRadius = 5
        
        cell.layer.cornerRadius = 10

        return cell
    }
 
    /*var customTabBarItem:UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "YOUR_IMAGE_NAME")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "YOUR_IMAGE_NAME")) */
    // I added the above as potential code to include custom icons for the icons on the tab bar controller if needed -Vicky
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // sets the number of cells per row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let boundWidth = (collectionView.bounds.width/2.0)-40
        let boundHeight = boundWidth

        return CGSize(width: boundWidth, height: boundHeight)
    }
    
    // sets the margins
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSubjectDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSubjectDetail",
            let destVC = segue.destination as? SubjectDetailTableViewController,
            let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
            destVC.subject = items[indexPath.row]
        }
        
    }
    
    //MARK: - Adding a new subject
    @IBAction func addSubject(_ sender: Any) {
        // set up UIAlertController
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            let answer = ac.textFields![0]
            if (answer.text! != "") {
                print(answer.text!)
                self.items.append(
                    Subject(name: answer.text!)
                );
                print(self.items)
                self.collectionView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)

        ac.addAction(cancelAction)
        ac.addAction(submitAction)

        present(ac, animated: true)
    }
}
