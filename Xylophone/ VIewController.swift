//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func playThatNote(noteFileName : String) {
        // Next, create a url pointing to the desired wav file
        
        let noteUrl = Bundle.main.url(forResource: noteFileName, withExtension: "wav")!
        
        // Now, play the note on the iPhone
        
        do {
            player = try AVAudioPlayer(contentsOf: noteUrl)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        // There are 7 note?.wav files, each with a note to play when the corresponding key is played
        // They are named note1, note2 ... etc. All are linked to the same IBAction notePressed
        // The tag tells us which note to "play", so we append the tag number to "note" to select the proper wav
        // file
        
        playThatNote(noteFileName: "note"+String(sender.tag))
        
    }
    
}

