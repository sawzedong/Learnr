import UIKit
class SubjectsCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "subjectCell"
    
    // placeholder items
    var items = ["1", "2", "3", "4", "5", "6"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // number of cells in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SubjectsCollectionViewCell
        cell.subjectLabel.text = self.items[indexPath.row]
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
    //I added the above as potential code to include custom icons for the icons on the tab bar controller if needed -Vicky
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //handle clicks
        performSegue(withIdentifier: "openSubjectDetail", sender: nil)
    }
    
    //MARK: - Adding a new subject
    @IBAction func addSubject(_ sender: Any) {
        // set up UIAlertController
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        // !Failed attempt to add PickerView
        /*
        let pv = UIPickerView()
        let pickerData = ["Humanities", "Languages", "Sciences/Math"]
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // The number of rows of data
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
        
        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
        }
        ac.view.addSubview(pv)
        */
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            let answer = ac.textFields![0]
            if (answer.text! != "") {
                print(answer.text!)
                self.items.append(answer.text!);
                print(self.items)
//                self.collectionView.reloadData()
// !Line 95 throws error: Type of expression is ambiguous without more context
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)

        ac.addAction(cancelAction)
        ac.addAction(submitAction)

        present(ac, animated: true)
    }
}
