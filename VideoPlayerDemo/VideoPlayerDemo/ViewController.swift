//
//  ViewController.swift
//  VideoPlayerDemo
//
//  Created by MRT102 on 12/12/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoPLayerView: UIView!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var slider: UISlider!
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
              btnPause.isHidden = true
               slider.minimumValue = 0
                slider.value = 0
               slider.maximumValue = 1 // Set a default value for the maximum. It will be updated once the video starts playing.
               slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
           }

           @objc func sliderValueChanged() {
               let time = CMTime(seconds: Double(slider.value), preferredTimescale: 1)
               player?.seek(to: time)
           }

           func addTimeObserver() {
               player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: DispatchQueue.main) { [weak self] time in
                   self?.updateSliderValue()
               }
           }

           func updateSliderValue() {
               guard let player = player else { return }
               let duration = player.currentItem?.duration.seconds ?? 0
               slider.maximumValue = Float(duration)
               slider.value = Float(player.currentTime().seconds)
           }

    
    @IBAction func playVideoBtnAction(_ sender: Any) {
        guard let videoURL = URL(string: "https://static.pexels.com/lib/videos/free-videos.mp4") else {
                   return
               }

               player = AVPlayer(url: videoURL)

        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            // Optionally: Customize playerViewController
           
        }
               player?.play()
              
               addTimeObserver()
    
        
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus", let change = change, let newValue = change[NSKeyValueChangeKey.newKey] as? Int, let oldValue = change[NSKeyValueChangeKey.oldKey] as? Int {
            let oldStatus = AVPlayer.TimeControlStatus(rawValue: oldValue)
            let newStatus = AVPlayer.TimeControlStatus(rawValue: newValue)
            if newStatus != oldStatus {
                DispatchQueue.main.async {[weak self] in
                    if newStatus == .playing || newStatus == .paused {
                        self?.ActivityIndicator.isHidden = true
                    } else {
                        self?.ActivityIndicator.isHidden = false
                    }
                }
            }
        }
    }
    
    @IBAction func btnPauseVideoBtn(_ sender: Any) {
       print("hello")
    }
    
    @IBAction func skipBackward(_ sender: Any) {
            guard let player = player else { return }
            let currentTime = player.currentTime().seconds
            let newTime = max(currentTime - 10, 0)
            let time = CMTime(seconds: newTime, preferredTimescale: 1)
            player.seek(to: time)
        }

        @IBAction func skipForward(_ sender: Any) {
            guard let player = player, let duration = player.currentItem?.duration.seconds else { return }
            let currentTime = player.currentTime().seconds
            let newTime = min(currentTime + 10, duration)
            let time = CMTime(seconds: newTime, preferredTimescale: 1)
            player.seek(to: time)
        }
}

