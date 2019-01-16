//
//  ServiceViewController.swift
//  UngService
//
//  Created by MasterUNG on 16/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit
import AVFoundation

class ServiceViewController: UIViewController, AVAudioPlayerDelegate{
    
    let notes = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func myButton(_ sender: UIButton) {
        
        print("Tag ==> \(sender.tag)")
        let index = (sender.tag) - 1
        
        let soundURL = Bundle.main.url(forResource: notes[index], withExtension: "wav")
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch let error as NSError {
            print(error)
        }
        audioPlayer!.play()
        
    }
    

}
