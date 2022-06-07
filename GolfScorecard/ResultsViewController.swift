//
//  ResultsViewController.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/7/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var course:Course?
    
    // Course Stats
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var holesPlayedLabel: UILabel!
    @IBOutlet weak var totalParLabel: UILabel!
    @IBOutlet weak var totalDistanceLabel: UILabel!
    
    // Player One Stats
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerOneParLabel: UILabel!
    
    // Player Two Stats
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var playerTwoParLabel: UILabel!
    
    // Player Three Stats
    @IBOutlet weak var playerThreeNameLabel: UILabel!
    @IBOutlet weak var playerThreeScoreLabel: UILabel!
    @IBOutlet weak var playerThreeParLabel: UILabel!
    
    // Player Four Stats
    @IBOutlet weak var playerFourNameLabel: UILabel!
    @IBOutlet weak var playerFourScoreLabel: UILabel!
    @IBOutlet weak var playerFourParLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let course = course {
            courseNameLabel.text = course.courseName
            holesPlayedLabel.text = String(course.holes.count) + " Holes"
            totalParLabel.text = "Course Par: " + String(course.totalPar)
            totalDistanceLabel.text = "Course Distance: " + String(course.totalDistance)
            
            // Do any additional setup after loading the view.
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
        else{
            print("Failed to create results view controller")
        }
        
    }
    
    private func onePlayer(){
        playerTwoNameLabel.layer.opacity = 0
        playerTwoScoreLabel.layer.opacity = 0
        playerTwoParLabel.layer.opacity = 0
        playerThreeNameLabel.layer.opacity = 0
        playerThreeScoreLabel.layer.opacity = 0
        playerThreeParLabel.layer.opacity = 0
        playerFourNameLabel.layer.opacity = 0
        playerFourScoreLabel.layer.opacity = 0
        playerFourParLabel.layer.opacity = 0
        
        playerOneNameLabel.text = course!.golfers![0].name
        playerOneScoreLabel.text = String(course!.golfers![0].score)
        
        // Calculate the +/- par for player one
        var playeronePar = course!.golfers![0].score - course!.totalPar
        if playeronePar > 0 {
            playerOneParLabel.text = "+" + String(playeronePar)
        }
        else{
            playerOneParLabel.text = String(playeronePar)
        }
        
        
    }
    
    private func twoPlayer(){
        playerThreeNameLabel.layer.opacity = 0
        playerThreeScoreLabel.layer.opacity = 0
        playerThreeParLabel.layer.opacity = 0
        playerFourNameLabel.layer.opacity = 0
        playerFourScoreLabel.layer.opacity = 0
        playerFourParLabel.layer.opacity = 0
        
        playerOneNameLabel.text = course!.golfers![0].name
        playerOneScoreLabel.text = String(course!.golfers![0].score)
        playerTwoNameLabel.text = course!.golfers![1].name
        playerTwoScoreLabel.text = String(course!.golfers![1].score)
        
        // Calculate the +/- par for player one
        var playeronePar = course!.golfers![0].score - course!.totalPar
        if playeronePar > 0 {
            playerOneParLabel.text = "+" + String(playeronePar)
        }
        else{
            playerOneParLabel.text = String(playeronePar)
        }
        // Calculate the +/- par for player two
        var playertwoPar = course!.golfers![1].score - course!.totalPar
        if playertwoPar > 0 {
            playerTwoParLabel.text = "+" + String(playertwoPar)
        }
        else{
            playerTwoParLabel.text = String(playertwoPar)
        }
        
    }
    
    private func threePlayer(){
        playerFourNameLabel.layer.opacity = 0
        playerFourScoreLabel.layer.opacity = 0
        playerFourParLabel.layer.opacity = 0
        
        playerOneNameLabel.text = course!.golfers![0].name
        playerOneScoreLabel.text = String(course!.golfers![0].score)
        playerTwoNameLabel.text = course!.golfers![1].name
        playerTwoScoreLabel.text = String(course!.golfers![1].score)
        playerThreeNameLabel.text = course!.golfers![2].name
        playerThreeScoreLabel.text = String(course!.golfers![2].score)
        
        // Calculate the +/- par for player one
        var playeronePar = course!.golfers![0].score - course!.totalPar
        if playeronePar > 0 {
            playerOneParLabel.text = "+" + String(playeronePar)
        }
        else{
            playerOneParLabel.text = String(playeronePar)
        }
        // Calculate the +/- par for player two
        var playertwoPar = course!.golfers![1].score - course!.totalPar
        if playertwoPar > 0 {
            playerTwoParLabel.text = "+" + String(playertwoPar)
        }
        else{
            playerTwoParLabel.text = String(playertwoPar)
        }
        // Calculate the +/- par for player three
        var playerthreePar = course!.golfers![2].score - course!.totalPar
        if playerthreePar > 0 {
            playerThreeParLabel.text = "+" + String(playerthreePar)
        }
        else{
            playerThreeParLabel.text = String(playerthreePar)
        }
        
        
        
    }
    
    private func fourPlayer(){
        playerOneNameLabel.text = course!.golfers![0].name
        playerOneScoreLabel.text = String(course!.golfers![0].score)
        playerTwoNameLabel.text = course!.golfers![1].name
        playerTwoScoreLabel.text = String(course!.golfers![1].score)
        playerThreeNameLabel.text = course!.golfers![2].name
        playerThreeScoreLabel.text = String(course!.golfers![2].score)
        playerFourNameLabel.text = course!.golfers![3].name
        playerFourScoreLabel.text = String(course!.golfers![3].score)
        
        // Calculate the +/- par for player one
        var playeronePar = course!.golfers![0].score - course!.totalPar
        if playeronePar > 0 {
            playerOneParLabel.text = "+" + String(playeronePar)
        }
        else{
            playerOneParLabel.text = String(playeronePar)
        }
        // Calculate the +/- par for player two
        var playertwoPar = course!.golfers![1].score - course!.totalPar
        if playertwoPar > 0 {
            playerTwoParLabel.text = "+" + String(playertwoPar)
        }
        else{
            playerTwoParLabel.text = String(playertwoPar)
        }
        // Calculate the +/- par for player three
        var playerthreePar = course!.golfers![2].score - course!.totalPar
        if playerthreePar > 0 {
            playerThreeParLabel.text = "+" + String(playerthreePar)
        }
        else{
            playerThreeParLabel.text = String(playerthreePar)
        }
        // Calculate the +/- par for player four
        var playerfourPar = course!.golfers![3].score - course!.totalPar
        if playerfourPar > 0 {
            playerFourParLabel.text = "+" + String(playerfourPar)
        }
        else{
            playerFourParLabel.text = String(playerfourPar)
        }
        
    }
    

    @IBAction func finishTapped(_ sender: Any) {
        
        // TODO: Go back to the beginning and save the score card to the history
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
    }
    

}
