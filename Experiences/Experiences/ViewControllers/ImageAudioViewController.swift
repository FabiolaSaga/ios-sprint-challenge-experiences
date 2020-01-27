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
            self.updateImage()
        }
    }
    var imageData: Data?
    private let context = CIContext(options: nil)
    private let filter = CIFilter(name: "CIColorMonochrome")!
    var audioRecorder: AVAudioRecorder?
    var recordingURL: URL?
    var isRecording: Bool {
        return audioRecorder?.isRecording ?? false
    }
    
    //MARK: Actions
    
   
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        self.presentImagePickerController()
    }
    
    
    @IBAction func audioRecorderButtonTapped(_ sender: UIButton) {
    }
    
    //MARK: Methods
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { NSLog("The photo library is not available!"); return }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func image(byFiltering image: UIImage) -> UIImage {
        guard let cgImage = image.cgImage else { return image }
        let ciImage = CIImage(cgImage: cgImage)
        
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        
        guard let outputCIImage = filter.outputImage else { return image }
        guard let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return image }
        let filteredImage = UIImage(cgImage: outputCGImage)
        
        let imageData = filteredImage.jpegData(compressionQuality: 1)!
        self.imageData = imageData
                
        return filteredImage
    }
    
    private func updateImage() {
        if let image = self.originalImage {
            imageView.image = self.image(byFiltering: image)
        } else {
            imageView.image = nil
        }
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
