//
//  ViewController.swift
//  Word Garden
//
//  Created by Shane Barys on 2/2/20.
//  Copyright © 2020 Shane Barys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    let wordArray = ["SWIFT", "CODE", "PROGRAM", "XCODE"]
    var wordArrayCount = 0
    var wordToGuess: String!
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        formatUserGuessLabel()
        
        
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        wordToGuess = wordArray[wordArrayCount]
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord = revealedWord + " _"
            }

        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(guessedLetterField.text!) {
            wrongGuessesRemaining = wrongGuessesRemaining-1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        let revealedWord = userGuessLabel.text!
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "Sorry, you're all out of guesses...try again?"
        } else if !revealedWord.contains("_") {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            let guess = (guessCount == 1 ? "guess" : "guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)!"
        }
    
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()

        
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else{
            guessLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()

    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessLetterButton.isEnabled = false
        guessedLetterField.isEnabled = true
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 guesses!"
        guessCount = 0
        if wordArrayCount <= 2 {
            wordArrayCount += 1
        } else {
            wordArrayCount = 0
        }
        wordToGuess = wordArray[wordArrayCount]
        formatUserGuessLabel()
    }
}

