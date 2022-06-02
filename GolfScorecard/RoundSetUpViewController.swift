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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func startTapped(_ sender: Any) {
        
        var golfers = [Golfer]()
        
        if ((golferOneTextField.text?.isEmpty) != nil){
            let golferOne = Golfer()
            golferOne.name = golferOneTextField.text!
            golferOne.score = 0
            golfers.append(golferOne)
        }
        
        if ((golferTwoTextField.text?.isEmpty) != nil){
            let golferTwo = Golfer()
            golferTwo.name = golferTwoTextField.text!
            golferTwo.score = 0
            golfers.append(golferTwo)
        }
        
        if ((golferThreeTextField.text?.isEmpty) != nil){
            let golferThree = Golfer()
            golferThree.name = golferThreeTextField.text!
            golferThree.score = 0
            golfers.append(golferThree)
        }
        
        if ((golferFourTextField.text?.isEmpty) != nil){
            let golferFour = Golfer()
            golferFour.name = golferFourTextField.text!
            golferFour.score = 0
            golfers.append(golferFour)
        }
        
        
        
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
