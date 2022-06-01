//
//  ViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 5/27/22.
//

import UIKit

extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var newRoundButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.newRoundButton.applyGradient(colours: [.green, UIColor(ciColor: .blue)])
        
        self.historyButton.applyGradient(colours: [UIColor(ciColor: .blue), .green])
        
       
    }
    
    
    @IBAction func newRoundTapped(_ sender: Any) {
    }
    
    @IBAction func historyTapped(_ sender: Any) {
    }
    
}

