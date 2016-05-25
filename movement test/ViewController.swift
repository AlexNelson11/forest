//
//  ViewController.swift
//  movement test
//
//  Created by Alex Nelson on 5/18/16.
//  Copyright © 2016 Alex Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var creatureImageView: UIImageView!
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var movesUpLabel: UILabel!
    @IBOutlet var exploredUpLabel: UILabel!
    @IBOutlet var numberOfTreesToGenerateLabel: UILabel!
    @IBOutlet var whereToGenerateTreeLabel: UILabel!
    @IBOutlet var numberOfTreesLabel: UILabel!
    
    var screenWidthCGfl: CGFloat = UIScreen.mainScreen().bounds.width / 27
    var screenHeightCGfl: CGFloat = UIScreen.mainScreen().bounds.height / 27
    var screenWidth: Int!
    var screenHeight: Int!
    
    var movesRight: Int = 0
    var movesUp: Int = 0
    
    var exploredRight: Int = 0
    var exploredLeft: Int = 0
    var exploredUp: Int = 0
    var exploredDown: Int = 0
    
    var numberOfTreesToGenerate: Int = 0
    var whereToGenerateTree: Int = 0
    var numberOfTrees: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = Int(screenWidthCGfl)
        screenHeight = Int(screenHeightCGfl)
        
        showProgress()
        
        //Do any additional setup after loading the view, typically from a nib.
        // treeImageView = UIImageView(frame: CGRectMake(240, 232, 53, 53))
        //treeImageView.image = UIImage(named: "tree.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveUp(){
        creatureImageView.image = UIImage(named: "creatureUp.png")
        
        movesUp = movesUp + 1
        
        let appframe: CGRect = UIScreen.mainScreen().bounds
        let x = CGFloat((movesRight * 27) + 240)
        let y = CGFloat((movesUp * 27) + 240)
        treeImageView.frame = CGRectMake(x, y, 54, 54)
        
        if movesUp >= exploredUp{
            exploredUp = exploredUp + 1
            
            print("aaa")
            
            /*var treeImageView2x: Int = whereToGenerateTree
            var treeImageView2y: Int = exploredUp
            
            
            var treeImageView2: UIImageView!
            //treeImageView2.image = UIImage(named: "tree.png")
            //self.view.addSubview(treeImageView2)
            
            treeImageView2 = UIImageView(frame: CGRectMake((CGFloat((movesUp * 27) + (whereToGenerateTree * 27))), (CGFloat((movesRight * 27) + (exploredUp * 27))), 54, 54))
            
            let tree2x = CGFloat((movesRight * 27) + (treeImageView2x * 27))
            let tree2y = CGFloat((movesUp * 27) + (treeImageView2y * 27))
            treeImageView2.frame = CGRectMake(tree2x, tree2y, 54, 54)
            
            
            */numberOfTreesToGenerate = Int(arc4random_uniform(UInt32(exploredRight + exploredLeft + screenWidth) / 2))
            
            func generateTreeUp(){
                if numberOfTreesToGenerate != 0{
                    print(String(numberOfTreesToGenerate))
                    
                    whereToGenerateTree = Int(arc4random_uniform(UInt32(exploredRight + exploredLeft + screenWidth)))
                    whereToGenerateTree = whereToGenerateTree - (exploredLeft + (screenWidth / 2))
                    whereToGenerateTree = whereToGenerateTree * 27
                    
                    numberOfTrees = numberOfTrees + 1
                    
                    
                    numberOfTreesToGenerate = numberOfTreesToGenerate - 1
                    
                    let generatedTreeImageView: UIImageView! = UIImageView(frame: CGRectMake((CGFloat((whereToGenerateTree * 27))), (CGFloat((screenHeight * 27 / 2))), 54, 54))
                    generatedTreeImageView.image = UIImage(named: "tree.png")
                    self.view.addSubview(generatedTreeImageView)
                    
                    let generatedTreeMovesUp = movesUp + (screenHeight / 2)
                    let generatedTreeMovesRight = whereToGenerateTree + (screenWidth / 2)
                    
                    let appframe: CGRect = UIScreen.mainScreen().bounds
                    let generatedTreeX = CGFloat((movesRight * 27) + generatedTreeMovesRight)
                    let generatedTreeY = CGFloat((movesUp * 27) + generatedTreeMovesUp)
                    generatedTreeImageView.frame = CGRectMake(generatedTreeX, generatedTreeY, 54, 54)
                    
                    showProgress()
                    
                    generateTreeUp()
                    
                }
                
            }
            
            generateTreeUp()
            
            
        }
        
    }
    @IBAction func moveRight(){
        creatureImageView.image = UIImage(named: "creatureRight.png")
        
        movesRight = movesRight - 1
        
        if ( -1 * movesRight) >= exploredRight{
            exploredRight = exploredRight + 1
            
            numberOfTreesToGenerate = Int(arc4random_uniform(UInt32(exploredUp + exploredDown + screenHeight ) / 2))
        }
        
        let appframe: CGRect = UIScreen.mainScreen().bounds
        let x = CGFloat((movesRight * 27) + 240)
        let y = CGFloat((movesUp * 27) + 240)
        treeImageView.frame = CGRectMake(x, y, 54, 54)
        
        showProgress()

    }
    @IBAction func moveLeft(){
        creatureImageView.image = UIImage(named: "creatureLeft.png")
        
        movesRight = movesRight + 1
        
        if movesRight >= exploredLeft{
            exploredLeft = exploredLeft + 1
            
            numberOfTreesToGenerate = Int(arc4random_uniform(UInt32(exploredUp + exploredDown + screenHeight ) / 2))
        }
        
        let appframe: CGRect = UIScreen.mainScreen().bounds
        let x = CGFloat((movesRight * 27) + 240)
        let y = CGFloat((movesUp * 27) + 240)
        treeImageView.frame = CGRectMake(x, y, 54, 54)
        
        showProgress()

    }
    @IBAction func moveDown(){
        creatureImageView.image = UIImage(named: "creatureDown.png")
        
        movesUp = movesUp - 1
        
        if ( -1 * movesUp) >= exploredDown{
            exploredDown = exploredDown + 1
            
            numberOfTreesToGenerate = Int(arc4random_uniform(UInt32(exploredRight + exploredLeft + screenWidth ) / 2))
        }
        
        let appframe: CGRect = UIScreen.mainScreen().bounds
        let x = CGFloat((movesRight * 27) + 240)
        let y = CGFloat((movesUp * 27) + 240)
        treeImageView.frame = CGRectMake(x, y, 54, 54)
        
        showProgress()

    }
    
    func showProgress(){
        movesUpLabel.text = String(movesUp)
        exploredUpLabel.text = String(exploredUp)
        numberOfTreesToGenerateLabel.text = String(numberOfTreesToGenerate)
        whereToGenerateTreeLabel.text = String(whereToGenerateTree)
        numberOfTreesLabel.text = String(numberOfTrees)
        
    }
}

