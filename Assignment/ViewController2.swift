//
//  ViewController2.swift
//  Assignment
//
//  Created by Sagar Kumar on 4/14/17.
//  Copyright © 2017 PurpleHawlk. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    var amount:Int?
    var country:String?
    
    @IBOutlet weak var view3Image: UIImageView!
    @IBOutlet weak var view1Image: UIImageView!
    @IBOutlet weak var view2Image: UIImageView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    var red1 = 0.9
    var green1 = 0.2745
    var blue1 = 0.3647
    var red2 = 0.0471
    var green2 = 0.2509
    var blue2 = 0.3255

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient1:CAGradientLayer = CAGradientLayer()
        gradient1.frame = self.view1Image.frame
        gradient1.colors = [UIColor(red: 82.0/255.0,green: 164.0/255.0, blue: 245.0/255.0,alpha: 1).cgColor,UIColor(red: 121.0/255.0, green: 115.0/255.0,blue: 244.0/255.0,alpha: 1).cgColor]
        gradient1.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient1.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.view1Image.layer.addSublayer(gradient1)
        // Do any additional setup after loading the view.
        let gradient2:CAGradientLayer = CAGradientLayer()
        gradient2.frame = self.view2Image.frame
        gradient2.colors = [UIColor(red: 181.0/255.0,green: 67.0/255.0, blue: 232.0/255.0,alpha: 1).cgColor,UIColor(red: 145.0/255.0, green: 67.0/255.0,blue: 246.0/255.0,alpha: 1).cgColor]
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient2.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.view2Image.layer.addSublayer(gradient2)
        
        let gradient3:CAGradientLayer = CAGradientLayer()
        gradient3.frame = self.view3Image.frame
        gradient3.colors = [UIColor(red: 241.0/255.0,green: 137.0/255.0, blue: 81.0/255.0,alpha: 1).cgColor,UIColor(red: 224.0/255.0, green: 94.0/255.0,blue: 108.0/255.0,alpha: 1).cgColor]
        gradient3.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient3.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.view3Image.layer.addSublayer(gradient3)
        
        moneyLabel.text = "$" + String(describing: amount!)
        let con = country?.uppercased()
        countryLabel.text = con
        
        self.view1Image.layer.cornerRadius = 2
        self.view1Image.clipsToBounds = true
        self.view2Image.layer.cornerRadius = 2
        self.view2Image.clipsToBounds = true
        self.view3Image.layer.cornerRadius = 2
        self.view3Image.clipsToBounds = true
        self.view1.layer.cornerRadius = 2
        self.view1.clipsToBounds = true
        self.view2.layer.cornerRadius = 2
        self.view2.clipsToBounds = true
        self.view3.layer.cornerRadius = 2
        self.view3.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
