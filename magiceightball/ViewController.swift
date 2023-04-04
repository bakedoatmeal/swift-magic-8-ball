//
//  ViewController.swift
//  magiceightball
//
//  Created by Jane Cui on 2023-04-04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let answers = ["Yes, definitely", "It is certain", "Without a doubt", "Yes", "Most likely", "Sure, why not?", "Same", "Tell me more", "Out to lunch", "Reply hazy, try again", "Ask again later", "The cake is a lie", "42", "TMI", "Very doubtful", "Don't count on it", "My reply is no", "Absolutely not"]
    
    let startups = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]
    
    let users = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]
    
    @IBOutlet weak var choicesController: UISegmentedControl!
    
    @IBOutlet weak var shakeButton: UIButton!
    
    func generateAnswer() {
        let randomIndex = Int.random(in: 0..<answers.count)

        answerLabel.text = answers[randomIndex]
    }
    
    func generateIdea() {
        let randomIndex = Int.random(in: 0..<answers.count)
        let randomIndex2 = Int.random(in: 0..<answers.count)

        
        answerLabel.text = "\(startups[randomIndex]) for \(users[randomIndex2])"
    }
    
    @IBAction func choicesController(_ sender: Any) {
        if choicesController.selectedSegmentIndex == 0 {
            answerLabel.text = "Have a question?"
            shakeButton.setTitle("Shake it!", for: .normal)
        } else if choicesController.selectedSegmentIndex == 1 {
            answerLabel.text = "Click to generate idea"
            shakeButton.setTitle("Think!", for: .normal)
        }
    }
    
    @IBAction func shakeButtonTapped(_ sender: Any) {
        if choicesController.selectedSegmentIndex == 0 {
            generateAnswer()
        } else if choicesController.selectedSegmentIndex == 1 {
            generateIdea()
        }
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        generateAnswer()
    }


}

