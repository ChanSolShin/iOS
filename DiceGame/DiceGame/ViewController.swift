//
//  ViewController.swift
//  DiceGame
//
//  Created by 신찬솔 on 2023/12/30.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var first: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        //첫번째 이미지뷰의 이미지를 랜덤으로 변경
        first.image=diceArray.randomElement()
        //두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image=diceArray.randomElement()
        
        
    }
    
}

