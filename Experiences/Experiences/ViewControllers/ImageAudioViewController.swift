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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
