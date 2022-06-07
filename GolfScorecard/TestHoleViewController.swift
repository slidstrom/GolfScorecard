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
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        if let course = course {
            courseNameLabel.text = course.courseName!
            
            let current = course.currentHole + 1
            
            holeNumber.text = "Hole " + String(current)
            
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
        // Increment current hole
        // Add hole scores to player scores
        // Save the par and the distance of the hole
        
        if golferOneScoreTextField.text?.isEmpty == true || parTextField.text?.isEmpty == true || distanceTextField.text?.isEmpty == true{
            print("Fill out missing field to continue and see scores")
            return
        }
        
        // convert distance and par strings to ints and save them
        var currentHole = course!.holes[course!.currentHole]
        
        // Grab the distance and par if they are integers
        if let distance = Int(distanceTextField.text!){
            if let par = Int(parTextField.text!){
                currentHole.par = par
                currentHole.distance = distance
            }
            else{
                print("Still a string :(")
                return
            }
        }
        else{
            print("Still a string :(")
            return
        }
        
        if course!.golfers!.count == 1{
            let golfer1Score = Int(golferOneScoreTextField.text!)!
            course!.golfers![0].score += golfer1Score
            
        }
        else if course!.golfers!.count == 2{
            let golfer1Score = Int(golferOneScoreTextField.text!)!
            course!.golfers![0].score += golfer1Score
            let golfer2Score = Int(golferTwoScoreTextField.text!)!
            course!.golfers![1].score += golfer2Score
            
        }
        else if course!.golfers!.count == 3{
            let golfer1Score = Int(golferOneScoreTextField.text!)!
            course!.golfers![0].score += golfer1Score
            let golfer2Score = Int(golferTwoScoreTextField.text!)!
            course!.golfers![1].score += golfer2Score
            let golfer3Score = Int(golferThreeScoreTextField.text!)!
            course!.golfers![2].score += golfer3Score
            
        }
        else{
            let golfer1Score = Int(golferOneScoreTextField.text!)!
            course!.golfers![0].score += golfer1Score
            let golfer2Score = Int(golferTwoScoreTextField.text!)!
            course!.golfers![1].score += golfer2Score
            let golfer3Score = Int(golferThreeScoreTextField.text!)!
            course!.golfers![2].score += golfer3Score
            let golfer4Score = Int(golferFourScoreTextField.text!)!
            course!.golfers![3].score += golfer4Score
        }
        
        
        // We successfully added the scores, go to next hole
        course!.currentHole += 1
        
        // If game is finished, go to results, if not, go to the next hole
        if course!.currentHole == course!.holes.count {
            print("Game is finished!")
            // Calculate the total par and total distance of the course
            for hole in course!.holes{
                course!.totalPar += hole.par
                course!.totalDistance += hole.distance
            }
            
            // TODO: Create results view controller and pass the current course through
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "results") as! ResultsViewController
            vc.modalPresentationStyle = .fullScreen
            vc.course = self.course
            self.present(vc, animated: false)
        }
        else{
            print("Game is not finished, play another hole!")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "hole") as! TestHoleViewController
            vc.modalPresentationStyle = .fullScreen
            vc.course = self.course
            self.present(vc, animated: false)
        }
        
        
        
    }
    
    // TODO: THIS IS CURRENTLY BEING TESTED, IF THIS BUTTON IS TAPPED, THE ROUND ENDS
    @IBAction func scorecardTapped(_ sender: Any) {
        // TODO: Create results view controller and pass the current course through
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "results") as! ResultsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.course = self.course
        self.present(vc, animated: false)
    }
    
    
    @IBAction func p4beginEdit(_ sender: Any) {
        self.view.frame.origin.y -= 100
    }
    
    @IBAction func p4endEdit(_ sender: Any) {
        self.view.frame.origin.y += 100
    }
    
    
    @IBAction func quitTapped(_ sender: Any) {
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
}
