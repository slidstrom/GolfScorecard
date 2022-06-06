//
//  RoundSetUpViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/2/22.
//

import UIKit

class RoundSetUpViewController: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var golferOneTextField: UITextField!
    @IBOutlet weak var golferTwoTextField: UITextField!
    @IBOutlet weak var golferThreeTextField: UITextField!
    @IBOutlet weak var golferFourTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // Models
    var course = Course()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == Constants.beginRoundSegue{

            // Create a new variable to store the instance of PlayerTableViewController
            let destinationVC = segue.destination as! TestHoleViewController
            destinationVC.course = self.course
            print("Beginning new round")
            

        }

    }
    
    @IBAction func startTapped(_ sender: Any) {
        
        let numHoles = segmentedControl.selectedSegmentIndex
        
        var holes = [Hole]()
        // 9 holes
        if numHoles == 0 {
            var i = 0
            while i < 9 {
                var hole = Hole()
                holes.append(hole)
                i += 1
                
            }
            
        }
        // 18 holes
        else{
            var i = 0
            while i < 18 {
                var hole = Hole()
                holes.append(hole)
                i += 1
            
            }
            
        }
        
        // This is not optional
        if courseNameTextField.text?.isEmpty == true{
            // TODO: Display some sort of error message, we want a course name
            return
        }
        else{
            let nameOfCourse = courseNameTextField.text!
            self.course.courseName = nameOfCourse
        }
        
        var golfers = [Golfer]()
        
        // Must be at least one golfer
        if ((golferOneTextField.text?.isEmpty) == true){
            return
        }
        else{
            let golferOne = Golfer()
            golferOne.name = golferOneTextField.text!
            golferOne.score = 0
            golfers.append(golferOne)
        }
        
        if ((golferTwoTextField.text?.isEmpty) != true){
            let golferTwo = Golfer()
            golferTwo.name = golferTwoTextField.text!
            golferTwo.score = 0
            golfers.append(golferTwo)
        }
        
        if ((golferThreeTextField.text?.isEmpty) != true){
            let golferThree = Golfer()
            golferThree.name = golferThreeTextField.text!
            golferThree.score = 0
            golfers.append(golferThree)
        }
        
        if ((golferFourTextField.text?.isEmpty) != true){
            let golferFour = Golfer()
            golferFour.name = golferFourTextField.text!
            golferFour.score = 0
            golfers.append(golferFour)
        }
        
        self.course.holes = holes
        self.course.golfers = golfers
        
        self.performSegue(withIdentifier: Constants.beginRoundSegue, sender: self)
        
    }
    
    
    
    
    
    // Temporary solution for when the keyboard covers the fourth golfers name field
    @IBAction func golferFourBeginEdit(_ sender: Any) {
        self.view.frame.origin.y -= 100
    }
    @IBAction func golferFourEndEdit(_ sender: Any) {
        self.view.frame.origin.y += 100
    }
    

}
    




// Put this piece of code anywhere you like
extension UIViewController {
func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}

@objc func dismissKeyboard() {
    view.endEditing(true)
}
}
