//
//  ViewController.swift
//  Animation and Timing
//
//  Created by Ritik Srivastava on 14/10/20.
//  Copyright © 2020 Ritik Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var block: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// anoher type of animaton
        //let tap = UITapGestureRecognizer(target: self, action: #selector(blockTapped))
        //block.addGestureRecognizer(tap)
        //block.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //now to give some delay we can use dispatch queue with delay of now+3 second
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.upMove()
        }
        
        
    }
    
    func upMove(){
        
        /// with an motion where velocity changes at some time like easeInOut , easeInDelay
        
        //UIView.animate(withDuration: 1.2, delay: 2, options: .curveEaseIn, animations: {
        //}, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
        /// with an spring motion
        //closer to 1  damped  else undamped motion (0 ... 1)
        // intial velocti which which it shoot (0...1)
        //UIView.animate(withDuration: 1.2, delay: 2, usingSpringWithDamping: 0.6, initialSpringVelocity: .3, options: .curveLinear, animations: {
            //<#code#>
        //}, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
        UIView.animate(withDuration: 1, animations: {
            
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width/2), y: 0)
            
        }) { (sucess) in
            if sucess{
                self.rightMove()
            }
        }
        
    }
    
    func rightMove(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.block.frame.origin = CGPoint(x: self.view.frame.size.width - self.block.frame.width, y:  self.view.center.y - (self.block.frame.height/2))
            
        }) { (sucess) in
            if sucess{
                self.downMove()
            }
        }
        
    }
    
    func downMove(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width/2), y:  self.view.frame.height - self.block.frame.height)
            
        }) { (sucess) in
            if sucess{
                self.leftMove()
            }
        }
        
    }
    
    func leftMove(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.block.frame.origin = CGPoint(x: 0, y:  self.view.center.y - (self.block.frame.height/2))
            
        }) { (sucess) in
            if sucess{
                self.resetMove()
            }
        }
        
    }
    
    func resetMove(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.block.center = CGPoint(x: self.view.center.x , y:  self.view.center.y )
            
        })
        
    }
    
    
    @objc func blockTapped(){
        UIView.animate(withDuration: 1.2) {
            let sizeMultiplier: CGFloat = 2
            
            //since we want to grow block size*2.5 in all direction
            let newWidth = self.block.frame.size.width * sizeMultiplier

            let newHeight = self.block.frame.size.height * sizeMultiplier

            // now new pos of x and y since as block grow
            let newX = self.block.frame.origin.x - (newWidth - self.block.frame.size.width) / 2

            let newY = self.block.frame.origin.y - (newHeight - self.block.frame.size.height) / 2

            //print(newX , newY ,newHeight , newWidth , self.block.frame.size.width)

            self.block.layer.frame = CGRect(x: newX, y: newY, width: newWidth, height: newWidth)
        }
    }
    
    
    
    
}

