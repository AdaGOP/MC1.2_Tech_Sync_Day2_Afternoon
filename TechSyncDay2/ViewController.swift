//
//  ViewController.swift
//  TechSyncDay2
//
//  Created by zein rezky chandra on 05/04/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    var firstNumber: Int = 0
    var secondNumber = 10
    var imagePicker = UIImagePickerController()
    let mentorNames = ["Zein", "Handy", "Octa", "Atoya", "Viona"]
    var arrayOfModel = [DataModel]()
    var newView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        print(calculate(n1: firstNumber, n2: secondNumber))
        let sortedMentorName = { (firstPerson: String, secondPerson: String) -> Bool in
            return firstPerson > secondPerson
        }
        sortMentorName(mentorNames: mentorNames) {
            self.executeOnSuccessCallback()
        } onFail: {
            self.executeOnFailCallback()
        }
        switchImage()
        */
        
        // ImagePicker configuration
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image"]
        
        // Set default element to our model
        initiateDefault()
    }
    @IBAction func showHelp(_ sender: UIButton) {
        setupNewView()
    }
    
    func setupNewView() {
        newView.frame = CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 200, height: 200)
        newView.backgroundColor = .red
        let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpOutside)
        closeButton.setTitle("close", for: .normal)
        closeButton.setTitleColor(.black, for: .normal)
        newView.addSubview(closeButton)
        view.addSubview(newView)
    }
    
    @objc func closeView() {
        newView.removeFromSuperview()
    }
    
    func initiateDefault() {
        arrayOfModel.append(DataModel(image: "7-minute-workout", name: "zein", age: 20))
        arrayOfModel.append(DataModel(image: "levelUp", name: "octa", age: 30))
        arrayOfModel.append(DataModel(image: "7-minute-workout", name: "toya", age: 35))
    }
    
    func switchImage() {
        imageProfile.image = #imageLiteral(resourceName: "levelUp")
    }
    
    func executeOnSuccessCallback() {
        print("mentor zein ketemu")
    }
    
    func executeOnFailCallback() {
        print("mentor zein tidak ketemu")
    }
    
    func sortMentorName(
        mentorNames: [String],
        onSuccess: @escaping() -> Void,
        onFail: @escaping() -> Void) {
        if mentorNames[0] == "Zein" {
            onSuccess()
        } else {
            onFail()
        }
    }
    
    func sortMentorName(firstPerson: String, secondPerson: String) -> Bool {
        return firstPerson > secondPerson
    }

    func calculate(n1: Int, n2: Int) -> Int {
        let total = n1 + n2
        return total
    }
    
    @IBAction func openFromLibrary(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Ini kondisi dimana user memilih image yang ada di gallery device, once image selected
        if let imageSelected = info[.editedImage] as? UIImage {
            imageProfile.image = imageSelected
            imagePicker.dismiss(animated: true, completion: nil) // pastikan di dismiss untuk image picker nya agar bisa balik ke view controller utama
        }        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.objectModel = arrayOfModel[0]
        }
    }
    
}


struct DataModel {
    var image = ""
    var name = ""
    var age = 0
}

