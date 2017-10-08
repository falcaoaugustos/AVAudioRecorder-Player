//
//  ViewController.swift
//  AVAudioRecorder-Player
//
//  Created by Augusto Falcão on 10/7/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let recorderManager = AudioRecorderManager()
    let playerManager = AudioPlayerManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onlyPlay(_ sender: Any) {
        if (!recorderManager.isActive()) {
            guard let url = recorderManager.currentURL() else { return }
            playerManager.play(withURL: url)
        }
    }

    @IBAction func recordStart(_ sender: Any) {
        playerManager.stop()
        recorderManager.record()
    }

    @IBAction func recordFinish(_ sender: Any) {
        recorderManager.stop()
    }
}

