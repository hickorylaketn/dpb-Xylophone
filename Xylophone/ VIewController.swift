//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController{
    
    var player : AVAudioPlayer?
    var noteTag : String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        noteTag = String(sender.tag)
        
        let noteUrl = Bundle.main.url(forResource: "note"+noteTag, withExtension: "wav")!
        
                   do {
                        player = try AVAudioPlayer(contentsOf: noteUrl)
                        guard let player = player else { return }
        
                        player.prepareToPlay()
                        player.play()
                    } catch let error as NSError {
                        print(error.description)
                    }
        
    }
 
}

