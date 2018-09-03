//
//  AlphabetVC.swift
//  Kidos
//
//  Created by Vu Duong on 9/2/18.
//  Copyright © 2018 Vu Duong. All rights reserved.
//

import UIKit
import AVFoundation

class AlphabetVC: UIViewController {
    
    var player : AVAudioPlayer?
    let soundArray = ["A","B","C","D","E"]
    var selectedSoundFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func letterBtnPressed(_ sender: UIButton) {
        
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        print(selectedSoundFileName)
        print(sender.tag)
        playSound()
        
    }
    
    func playSound() {
        
        let path = Bundle.main.path(forResource: selectedSoundFileName, ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        
        do {
            //create your audioPlayer in your parent class as a property
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch {
            print("couldn't load the file")
        }
    }
}
