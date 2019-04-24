//
//  ViewController.swift
//  GameGuessTheFlag
//
//  Created by Carlos Irigoyen on 4/24/19.
//  Copyright © 2019 Carlos Irigoyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var button1: UIButton!
  @IBOutlet var button2: UIButton!
  @IBOutlet var button3: UIButton!
  
  var countries = [String]()
  var score = 0
  var correctAnswer = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    button1.layer.borderColor = UIColor.lightGray.cgColor
    button2.layer.borderColor = UIColor.lightGray.cgColor
    button3.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion()
  }
  
  // Se agrega el action debido a la utilizacion del handler en el alert y se agrega = nil para no modificar el llamado en viewDidLoad
  func askQuestion(action: UIAlertAction! = nil) {
    countries.shuffle()
    correctAnswer = Int.random(in: 0 ... 2)
    
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    
    title = "\(countries[correctAnswer].uppercased()) (Score: \(score))"
  }


  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    if sender.tag == correctAnswer {
      score += 1
      title = "Respuesta correcta"
    } else {
      title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased()),"
    }
    print(score)
    let ac = UIAlertController(title: title, message: "Score is \(score)", preferredStyle: .alert)
    
    // Al agregar el handle el metodo askQuestion debe recibir un action UIAlertController
    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
    
    present(ac, animated: true )
    
  }
}

