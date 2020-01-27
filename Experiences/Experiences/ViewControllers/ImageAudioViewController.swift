//
//  ImageAudioViewController.swift
//  Experiences
//
//  Created by Fabiola S on 1/27/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

import UIKit
import AVFoundation

class ImageAudioViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var experienceTitleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageUploadButton: UIButton!
    @IBOutlet weak var audioRecorderButton: UIButton!
    
    //MARK: Properties
    var experienceController: ExperienceController?
    var originalImage: UIImage? {
        didSet {
            
        }
    }
    var imageData: Data?
    var audioRecorder: AVAudioRecorder?
    var recordingURL: URL?
    var isRecording: Bool {
        return audioRecorder?.isRecording ?? false
    }
    
    //MARK: Actions
    
   
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func audioRecorderButtonTapped(_ sender: UIButton) {
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

extension ImageAudioViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage {
            self.originalImage = img
        }
        
        self.imageUploadButton.isHidden = true
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
