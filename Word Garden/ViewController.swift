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
    
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
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
    }
}

