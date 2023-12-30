//
//  ViewController.swift
//  rsp
//
//  Created by 신찬솔 on 2023/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    var imageIndex = 0
    
    var cnt: Int = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var comChoice: Rsp = Rsp(rawValue: Int.random(in: 0...2))!
    var myChoice: Rsp = Rsp.rock
    var imageTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comImageView.image = #imageLiteral(resourceName: "rock")
        myImageView.image = #imageLiteral(resourceName: "rock")
        
        comChoiceLable.text="준비"
        myChoiceLable.text="준비"
        scoreLabel.text="0"
        startImageTimer()
    }
    func startImageTimer() {
        imageTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeImages), userInfo: nil, repeats: true)
       }

    @objc func changeImages() {
            // 순서대로 이미지 보여주기
            comImageView.image = UIImage(named: Rsp(rawValue: imageIndex % 3)!.imageName)

            imageIndex += 1
        }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
            let title = sender.currentTitle!
            print(title)
            
            switch title{
            case "가위":
                myChoice = Rsp.sisers
            case "바위":
                myChoice = Rsp.rock
            case "보":
                myChoice = Rsp.papers
            default:
                break
            }
    }
    func stopImageTimer() {
           imageTimer?.invalidate()
           imageTimer = nil
       }
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self = self else { return }
            
            // 이미지 변경 타이머 정지
            self.stopImageTimer()
            var comChoice: Rsp = Rsp(rawValue: Int.random(in: 0...2))!
            switch comChoice{
            case Rsp.rock:
                comImageView.image = #imageLiteral(resourceName: "rock")
                comChoiceLable.text="바위"
            case Rsp.sisers:
                comImageView.image = #imageLiteral(resourceName: "sisers")
                comChoiceLable.text="가위"
            case Rsp.papers:
                comImageView.image = #imageLiteral(resourceName: "paper")
                comChoiceLable.text="보"
            }
            
            switch myChoice {
            case Rsp.rock:
                myImageView.image = #imageLiteral(resourceName: "rock")
                myChoiceLable.text="바위"
            case Rsp.sisers:
                myImageView.image = #imageLiteral(resourceName: "sisers")
                myChoiceLable.text="가위"
            case Rsp.papers:
                myImageView.image = #imageLiteral(resourceName: "paper")
                myChoiceLable.text="보"
            }
            
            if comChoice==myChoice{
                mainLabel.text="비겼다"
            }
            else if comChoice == .rock && myChoice == .papers{
                mainLabel.text="이겼다"
                cnt=cnt+1
                scoreLabel.text = String(cnt)
            }
            else if comChoice == .papers && myChoice == .sisers{
                mainLabel.text="이겼다"
                cnt=cnt+1
                scoreLabel.text = String(cnt)
            }
            else if comChoice == .sisers && myChoice == .rock{
                mainLabel.text="이겼다"
                cnt=cnt+1
                scoreLabel.text = String(cnt)
            }
            else{
                mainLabel.text="졌다"
                cnt=cnt-1
                scoreLabel.text = String(cnt)
            }
            self.startImageTimer()
                    }
                }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comImageView.image = #imageLiteral(resourceName: "rock")
        comChoiceLable.text = "준비"
        myImageView.image = #imageLiteral(resourceName: "rock")
        myChoiceLable.text = "준비"
        
        mainLabel.text = "선택하세요"
        cnt=0
        scoreLabel.text = String(cnt)
        comChoice = Rsp(rawValue: Int.random(in: 0...2))!
        startImageTimer()
    }
}
