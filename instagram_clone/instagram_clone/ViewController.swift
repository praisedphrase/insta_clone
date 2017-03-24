//
//  ViewController.swift
//  instagram_clone
//
//  Created by  theronapei on 2017. 3. 21..
//  Copyright © 2017년  theronapei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SHViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    @IBAction func buttonPressed(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil )
    }
    
//    @IBAction func filterButtonPressed(_ sender: Any) {
//        let sharakuController = SHViewController(image: imageView.image!)
//        sharakuController.delegate = self
//        self.present(sharakuController, animated: true, completion: nil )
//    }
    
    func shViewControllerImageDidFilter(image: UIImage) {
        // 체크버튼
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    func shViewControllerDidCancel() {
        // 엑스버튼
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
            self.image = image
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FilterSegue"{
            let filterViewController = segue.destination as! FilterViewController
            filterViewController.image = image
        }
    }

}
