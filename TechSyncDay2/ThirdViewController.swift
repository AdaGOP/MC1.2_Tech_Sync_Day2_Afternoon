//
//  ThirdViewController.swift
//  TechSyncDay2
//
//  Created by zein rezky chandra on 05/04/21.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var titleIndex = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    func setupView() {
        detailTitle.text = titleIndex
        detailImage.image = UIImage(named: imageName)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
