//
//  ViewController.swift
//  Voice Changer
//
//  Created by Gideon Bamuleseyo on 7/6/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopButton.isHidden = true
    }

    @IBAction func recordAudio(_ sender: Any) {
        stopButton.isHidden = false
        recordingInProgress.isHidden = false
        //TODO: Record user's voice
        
    }

}

