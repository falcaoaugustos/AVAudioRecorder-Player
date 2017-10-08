//
//  AudioPlayerManager.swift
//  AVAudioRecorder-Player
//
//  Created by Augusto Falcão on 10/7/17.
//  Copyright © 2017 Augusto Falcão. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayerManager: NSObject {

    private var player: AVAudioPlayer?

    func stop() {
        if let audioPlayer = player, audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }

    func play(withURL url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let outError {
            print("Error for player init: \(outError)")
        }
        player?.delegate = self
        player?.play()
    }
}

extension AudioPlayerManager: AVAudioPlayerDelegate {

    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error = error {
            print("Error with player delegate, for error: \(error.localizedDescription)")
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if (flag) {
            print("Finish Playing")
        }
    }
}
