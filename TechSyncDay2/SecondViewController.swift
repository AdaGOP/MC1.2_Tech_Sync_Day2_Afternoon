//
//  SecondViewController.swift
//  TechSyncDay2
//
//  Created by zein rezky chandra on 05/04/21.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var productCollection: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var objectModel: DataModel?
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        if let object = objectModel {
            titleLabel.text = object.name
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCellIdentifier", for: indexPath) as? ProductCell
            if indexPath.row % 2 == 0 {
                cell?.productName.text = objectModel?.name
                cell?.productImage.image = UIImage(named: objectModel!.image)
//            }
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("yang selected index ke :\(indexPath.row)")
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ThirdViewController {
            destinationVC.titleIndex = "\(selectedIndex)"
            destinationVC.imageName = objectModel!.image
        }
    }

}
