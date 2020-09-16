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
        cell.backgroundColor = UIColor(red: CGFloat.random(in: 0.5...1), green: CGFloat.random(in: 0.5...1), blue: CGFloat.random(in: 0.5...1), alpha: 1)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // sets the number of cells per row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let boundWidth = (collectionView.bounds.width/2.0)-20
        let boundHeight = boundWidth

        return CGSize(width: boundWidth, height: boundHeight)
    }
    
    // sets the margins
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //handle clicks
        performSegue(withIdentifier: "openSubjectDetail", sender: nil)
    }
}
