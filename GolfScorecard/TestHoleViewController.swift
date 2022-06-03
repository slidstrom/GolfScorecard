//
//  TestHoleViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/3/22.
//

import UIKit

class TestHoleViewController: UIViewController {

    // Course Properties
    var course:Course?
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var holeNumber: UILabel!
    
    // Hole Properties
    @IBOutlet weak var parTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    
    // Golfer Names and Scores
    @IBOutlet weak var golferOneLabel: UILabel!
    @IBOutlet weak var golferOneScoreTextField: UITextField!
    
    @IBOutlet weak var golferTwoLabel: UILabel!
    @IBOutlet weak var golferTwoScoreTextField: UITextField!
    
    @IBOutlet weak var golferThreeLabel: UILabel!
    @IBOutlet weak var golferThreeScoreTextField: UITextField!
        
    @IBOutlet weak var golferFourLabel: UILabel!
    @IBOutlet weak var golferFourScoreTextField: UITextField!
    
    // Potential Error Message Label
    // TODO: Make color red
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let course = course {
            courseNameLabel.text = course.courseName!
            
            // TODO: Use enums?
            if course.golfers!.count == 1 {
                onePlayer()
            }
            else if course.golfers!.count == 2{
                twoPlayer()
            }
            else if course.golfers!.count == 3{
                threePlayer()
            }
            else{
                fourPlayer()
            }
        }
    }
    
    private func onePlayer(){
        golferTwoLabel.layer.opacity = 0
        golferThreeLabel.layer.opacity = 0
        golferFourLabel.layer.opacity = 0
        golferTwoScoreTextField.layer.opacity = 0
        golferThreeScoreTextField.layer.opacity = 0
        golferFourScoreTextField.layer.opacity = 0
        golferOneLabel.text = course!.golfers![0].name!
    }
    
    private func twoPlayer(){
        golferThreeLabel.layer.opacity = 0
        golferFourLabel.layer.opacity = 0
        golferThreeScoreTextField.layer.opacity = 0
        golferFourScoreTextField.layer.opacity = 0
        golferOneLabel.text = course!.golfers![0].name!
        golferTwoLabel.text = course!.golfers![1].name!
    }
    
    private func threePlayer(){
        golferFourLabel.layer.opacity = 0
        golferFourScoreTextField.layer.opacity = 0
        golferOneLabel.text = course!.golfers![0].name!
        golferTwoLabel.text = course!.golfers![1].name!
        golferThreeLabel.text = course!.golfers![2].name!
    }
    
    private func fourPlayer(){
        golferOneLabel.text = course!.golfers![0].name!
        golferTwoLabel.text = course!.golfers![1].name!
        golferThreeLabel.text = course!.golfers![2].name!
        golferFourLabel.text = course!.golfers![3].name!
    }
    
    @IBAction func nextHoleTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func scorecardTapped(_ sender: Any) {
    }
    

}
