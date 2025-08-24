//
//  AudioPlayer.swift
//  RestartTutorialApp
//
//  Created by Anthony on 25/8/25.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
      audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: path))
      audioPlayer?.play()
    // no need for do-catch if we unwrap AVAudioPlayer
  }
}
