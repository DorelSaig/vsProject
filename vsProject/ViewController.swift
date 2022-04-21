//
//  ViewController.swift
//  vsProject
//
//  Created by Dorel Saig on 19/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var panel_IMG_left: UIImageView!
    @IBOutlet weak var panel_IMG_right: UIImageView!
    @IBOutlet weak var panel_LBL_score_left: UILabel!
    @IBOutlet weak var panel_LBL_score_right: UILabel!
    @IBOutlet weak var panel_LBL_game_counter: UILabel!
    @IBOutlet weak var panel_BTN_play: UIButton!
    @IBOutlet weak var panel_IMG_left_profile: UIImageView!
    @IBOutlet weak var panel_IMG_right_profile: UIImageView!

    var panels: [UIImageView]!
    
    var score1: Int = 0
    var score2: Int = 0
    var game_counter: Int = 0
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initGame()
        panel_IMG_left.transform = CGAffineTransform(scaleX: -1, y: 1);
        panels = [panel_IMG_left, panel_IMG_right]
        
    }
    
    

    @IBAction func playClicked(_ sender: Any) {
        panel_BTN_play.isEnabled = false;
        
        initGame()
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [self] timer in
            self.playRound()

            if game_counter == 15 {
                timer.invalidate()
                checkOVERALLWinner(left: score1, right: score2)
                panel_BTN_play.isEnabled = true;
            }
        }
                

    }
    
    func initGame(){
        game_counter = 0
        panel_LBL_game_counter.text = "Game \(game_counter) / 15"
        panel_IMG_left_profile.image = #imageLiteral(resourceName: "player")
        panel_IMG_left_profile.image = #imageLiteral(resourceName: "player")
    }
    
    func playRound() {
        
        let IMAGES = [#imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "paper2"), #imageLiteral(resourceName: "scissors")]
        
        let rand_left = Int.random(in: 0 ..< IMAGES.count)
        panels[0].image = IMAGES[rand_left]
        let rand_right = Int.random(in: 0 ..< IMAGES.count)
        panels[1].image = IMAGES[rand_right]
        
        let score = checkWinner(left: rand_left, right: rand_right);
        
        if(score != 0){
            updateUi(score: score)
        }
        
        game_counter+=1;
        panel_LBL_game_counter.text = "Game \(game_counter) / 15"
    }
    
    func checkWinner(left: Int, right: Int) -> Int {
        if(left == right){
            return 0; // Tie Tie
        } else if (left == 0 && right == 2) {
            return 1; // Left Wins
        } else if (left == 2 && right == 0){
            return 2;
        } else if (left > right) {
            return 1;
        } else{
            return 2;
        }
    }
    
    func checkOVERALLWinner(left: Int, right: Int) {
        if(left > right){
            panel_IMG_left_profile.image = #imageLiteral(resourceName: "winner")
        }else if (left < right){
            panel_IMG_right_profile.image = #imageLiteral(resourceName: "winner")
        } else {
            
        }
    }
    
    func updateUi(score: Int){
        if (score==1){
            score1+=1;
            panel_LBL_score_left.text = "\(score1)"
        }else {
            score2+=1;
            panel_LBL_score_right.text = "\(score2)"
        }
    }
    
}

