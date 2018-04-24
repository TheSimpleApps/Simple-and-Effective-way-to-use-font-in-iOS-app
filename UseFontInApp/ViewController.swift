//
//  ViewController.swift
//  UseFontInApp
//
//  Created by Karamjeet Singh on 24/04/18.
//  Copyright © 2018 TheSimpleApps@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // IBOutlets
    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var lbl_3: UILabel!
    @IBOutlet weak var lbl_4: UILabel!
    @IBOutlet weak var lbl_5: UILabel!
    @IBOutlet weak var lbl_6: UILabel!
    @IBOutlet weak var lbl_7: UILabel!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         lbl_1.font = system12
         lbl_2.font = robotoThin20
         lbl_3.font = robotoBlack14
         lbl_4.font = helveticaLight13
         lbl_5.font = monoSpacedDigit
         lbl_6.font = DomotikaTrialHeavy16
         lbl_7.font = BubblerOne18

        Utility.logAllAvailableFonts()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

