//
//  CardView.swift
//  Zootopia
//
//  Created by Kader Oral on 15.07.2023.
//

import UIKit
import AVFoundation
import AVKit
protocol CardViewDelegate: AnyObject {
    func cardViewDidSelectVideo(withName videoName: String)
}
class CardView: UIView{
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var url: String?
    var openWebAction: ((_ urlString: String) -> ())?
    var videoName: String?
    weak var delegate: CardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        
    }
    
    private func setupView(){
        if let viewForXib = Bundle.main.loadNibNamed("CardView", owner: self)?[0] as? UIView{
            viewForXib.frame = self.bounds
            addSubview(viewForXib)
        }
    }
    @IBAction func openWebTapped(_ sender: Any) {
        openWebAction?(url ?? "https://developer.apple.com/forums/thread/670047")
        print("Button tapped url: \(String(describing: url))")
        
    }
    
    @IBAction func goToVideo(_ sender: Any) {
        guard let videoName = animalLabel.text, !videoName.isEmpty else {
            print("Video name is empty")
            return
        }
        print(videoName)
        delegate?.cardViewDidSelectVideo(withName: videoName)
        
    }
    
    
}
