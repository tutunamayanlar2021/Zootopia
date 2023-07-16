//
//  ViewController.swift
//  Zootopia
//
//  Created by Kader Oral on 15.07.2023.
//

import UIKit
import AVFoundation
import AVKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayAnimalCards()
        
        
    }
    func loadAnimalCardView() -> CardView {
        let nib = UINib(nibName: "CardView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? CardView else {
            fatalError("Could not instantiate AnimalCardView from XIB")
        }
        return view
    }
    func displayAnimalCards() {
        
        
        let cardWidth: CGFloat = 175.0
        let cardHeight: CGFloat = 240.0
        let cardSpacing: CGFloat = 20.0
        let margin: CGFloat = 10.0
        
        var currentX: CGFloat = margin
        var currentY: CGFloat = margin
        var maxWidth: CGFloat = 0.0
        var totalHeight: CGFloat = 0.0
        for (index, animals) in animals.enumerated() {
            let cardView = CardView()
            cardView.frame = CGRect(x: currentX, y: currentY+45, width: cardWidth, height: cardHeight)
            cardView.animalLabel.text = animals.name
            cardView.animalLabel.font = .boldSystemFont(ofSize: 20)
            cardView.imageView.image = animals.image
            cardView.url = animals.url
            cardView.videoName = animals.name.lowercased()
            cardView.delegate = self
            scrollView.addSubview(cardView)
            print(animals.name)
            
            
            maxWidth = max(maxWidth, currentX + cardWidth)
            totalHeight = currentY + cardHeight + cardSpacing
            
            currentX += cardWidth + cardSpacing
            
            if (index + 1) % 2 == 0 {
                currentX = margin
                currentY += cardHeight + cardSpacing
            }
            setupMyViews( with: cardView.url!, cardView: cardView )
        }
        
        scrollView.contentSize = CGSize(width: maxWidth + margin, height: totalHeight)
        contentHeightConstraint.constant = totalHeight
    }
    private func setupMyViews(with url: String ,cardView: CardView) {
        cardView.url = url
        cardView.openWebAction = routeWebVC()
    }
    
    func routeWebVC() -> (String) -> () {
        return {
            urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.url = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
}

//MARK: - CardViewDelegate
extension MainViewController:CardViewDelegate{
    func cardViewDidSelectVideo(withName videoName: String) {
        guard let videosURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Videos") else {
            print("Videos directory not found")
            return
        }
        
        let player = AVPlayer(url: videosURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }

}
