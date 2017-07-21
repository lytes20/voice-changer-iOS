//
//  PlaySoundsViewController.swift
//  Voice Changer
//
//  Created by Gideon Bamuleseyo on 7/11/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "sample", withExtension: "mp3") {
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.enableRate = true
            }catch let error as NSError{
                print(error.description)
            }
            
        }else{
            print ("file path is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowAudio(_ sender: Any) {
        audioPlayer?.stop()
        audioPlayer?.rate = 0.5
        audioPlayer?.currentTime=0.0
        audioPlayer?.play()
        
    }
    @IBAction func playFastAudio(_ sender: Any) {
        audioPlayer?.stop()
        audioPlayer?.rate = 1.5
        audioPlayer?.currentTime=0.0
        audioPlayer?.play()
        
    }
 
    @IBAction func stopAudio(_ sender: Any) {
        audioPlayer?.stop()
    }

}
