//
//  RecordSoundsViewController.swift
//  Voice Changer
//
//  Created by Gideon Bamuleseyo on 7/6/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
import CoreMedia

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder : AVAudioRecorder?
    
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopButton.isHidden = true
        recordingInProgress.isHidden = true
    }

    @IBAction func recordAudio(_ sender: Any) {
        stopButton.isHidden = false
        recordingInProgress.isHidden = false
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
        //TODO: Record user's voice        
        let currentDateTime = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.string(from: currentDateTime as Date) + ".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        print (filePath)
        var sesssion = AVAudioSession.sharedInstance()
        do{
            try sesssion.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch{}
        
        
        do {
            audioRecorder = try AVAudioRecorder(url: filePath!, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            
            
        } catch {
            
        }
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        //TODO: Step 1 - save the recorded audio
        //TODO: Step 2 - move to the next scene aka perform segue
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        audioRecorder?.stop()
        let sesssion = AVAudioSession.sharedInstance()
        do{try sesssion.setActive(false)}catch{}
        
    }
    

}

