//
//  ViewController.swift
//  NinjaGold
//
//  Created by Kaan Kabalak on 7/5/17.
//  Copyright © 2017 Kaan Kabalak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var coins = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buildingButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        if (sender.tag == 1) {
            coins = Int(arc4random_uniform(10)) + 10
            score += coins
            farmLabel.text = "You earned \(coins)"
            farmLabel.isHidden = false
            caveLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
        }
        else if(sender.tag == 2){
            coins = Int(arc4random_uniform(5)) + 5
            score += coins
            caveLabel.text = "You earned \(coins)"
            caveLabel.isHidden = false
            farmLabel.isHidden = true
            houseLabel.isHidden = true
            casinoLabel.isHidden = true
        }
        else if(sender.tag == 3){
            coins = Int(arc4random_uniform(3)) + 2
            score += coins
            houseLabel.text = "You earned \(coins)"
            houseLabel.isHidden = false
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            casinoLabel.isHidden = true
        }
        else if(sender.tag == 4){
            if(Int(arc4random_uniform(2)) == 1) {
                coins = Int(arc4random_uniform(51))
                score += coins
                casinoLabel.text = "You earned \(coins)"
            }
            else {
                coins = Int(arc4random_uniform(51))
                score -= coins
                casinoLabel.text = "You lost \(coins)"
            }
            casinoLabel.isHidden = false
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            houseLabel.isHidden = true
            
        }
        else {
            score = 0
            casinoLabel.isHidden = true
            caveLabel.isHidden = true
            farmLabel.isHidden = true
            houseLabel.isHidden = true
        }
        reloadUI()
    }
    
    func reloadUI() {
        scoreLabel.text = "Score: \(score)"
    }
    
}

