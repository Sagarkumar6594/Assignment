//
//  ViewController.swift
//  Assignment
//
//  Created by Sagar Kumar on 4/13/17.
//  Copyright © 2017 PurpleHawlk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageBackgroundView: UIImageView!
    @IBOutlet weak var tinderCard: UIView!
    @IBOutlet weak var rupeeLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    var divisor:CGFloat!
    var index2 = 1
    
    @IBOutlet weak var tripNumberLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var opacityView: UIImageView!
    
    var data = Array<Model>()
    
    let images = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3"),
        UIImage(named: "image4")!]
    //var index = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    var centerX: CGFloat?
    var centerY:CGFloat?
    var center:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame = self.opacityView.frame
        gradient.colors = [UIColor(red: CGFloat(red1),green: CGFloat(green1) , blue: CGFloat(blue1),alpha: 0.6).cgColor,UIColor(red: CGFloat(red2), green: CGFloat(green2),blue: CGFloat(blue2),alpha: 0.6).cgColor]
        self.opacityView.layer.addSublayer(gradient)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.helpClicked(_:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        for img in images{
            let mod = Model()
            if img == UIImage(named: "image1"){
                mod.imageName = "image1"
                mod.country = "Peru"
                mod.name = "Machu Picchu"
                mod.discription = "How about you explore culture event in "
                mod.number = 1
                mod.flagImage = "image1peru"
                mod.stars = 3
                mod.rupee = 490
                data.append(mod)
            }
            if img == UIImage(named: "image2"){
                mod.imageName = "image2"
                mod.country = "Mexico"
                mod.name = "Pyramid at Chichén Itzá"
                mod.discription = "How about you explore culture event in "
                mod.number = 2
                mod.flagImage = "image2mexico"
                mod.stars = 4
                mod.rupee = 590
                data.append(mod)
            }
            if img == UIImage(named: "image3"){
                mod.imageName = "image3"
                mod.country = "India"
                mod.name = "Taj Mahal"
                mod.discription = "How about you explore culture event in "
                mod.number = 3
                mod.flagImage = "image3india"
                mod.stars = 4
                mod.rupee = 690
                data.append(mod)
            }
            if img == UIImage(named: "image4"){
                mod.imageName = "image4"
                mod.country = "Jordan"
                mod.name = "Petra"
                mod.discription = "How about you explore culture event in "
                mod.number = 4
                mod.flagImage = "image4Jordan"
                mod.stars = 5
                mod.rupee = 500
                data.append(mod)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        centerX = tinderCard.center.x
        centerY = tinderCard.center.y
        center = tinderCard.center
        
        self.imageView.layer.cornerRadius = 4
        self.imageView.clipsToBounds = true
        self.imageView2.layer.cornerRadius = 4
        self.imageView2.clipsToBounds = true
        
        divisor = (view.frame.width / 2 ) / 0.60
        
    }
    
    
    var red1 = 0.9
    var green1 = 0.2745
    var blue1 = 0.3647
    var red2 = 0.0471
    var green2 = 0.2509
    var blue2 = 0.3255
    var index = 0
    override func viewWillAppear(_ animated: Bool) {
        tripNumberLabel.text = String(data[index].number)
        discriptionLabel.text = data[index].discription + data[index].country + "?"
        nameLabel.text = data[index].name + ", " + data[index].country
        countryImage.image = UIImage(named: data[index].flagImage)
        imageView.image = UIImage(named: data[index].imageName)
        imageView2.image = UIImage(named: data[index2].imageName)
        imageBackgroundView.image = UIImage(named: data[index].imageName)
        rupeeLabel.text = "$" + String(data[index].rupee)
        dispStarts(value: data[index].stars)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func helpClicked(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "moveSegue", sender: nil)
        print(index)
        
    }
    
    func dispStarts(value: Int){
        if value == 1{
            image1.isHighlighted = true
            image2.isHighlighted = false
            image3.isHighlighted = false
            image4.isHighlighted = false
            image5.isHighlighted = false
        }
        if value == 2{
            image1.isHighlighted = true
            image2.isHighlighted = true
            image3.isHighlighted = false
            image4.isHighlighted = false
            image5.isHighlighted = false
        }
        if value == 3{
            image1.isHighlighted = true
            image2.isHighlighted = true
            image3.isHighlighted = true
            image4.isHighlighted = false
            image5.isHighlighted = false
        }
        if value == 4{
            image1.isHighlighted = true
            image2.isHighlighted = true
            image3.isHighlighted = true
            image4.isHighlighted = true
            image5.isHighlighted = false
        }
        if value == 5{
            image1.isHighlighted = true
            image2.isHighlighted = true
            image3.isHighlighted = true
            image4.isHighlighted = true
            image5.isHighlighted = true
        }
    }
    
    @IBAction func panTinderCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        card.center = CGPoint(x: centerX! + point.x, y: centerY! + point.y)
        let xFromCenter = card.center.x - centerX!
        
        self.imageView.alpha = 1 - abs(xFromCenter)/centerX!
        self.imageView2.alpha =  abs(xFromCenter)/centerX!
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        
        
        if sender.state == UIGestureRecognizerState.ended{
            if card.center.x < 75{
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 100, y: card.center.y + 75 )
                    card.alpha = 0
                    self.imageView.alpha = 0
                })
                self.tinderCard.isHidden = true
                self.imageView.isHidden = true
                
                if index < 3 {
                    index += 1
                    if index2 == 3{
                        index2 = 0
                    } else{
                        index2 += 1
                    }
                    let toImage = UIImage(named: data[index].imageName)
                    UIView.transition(with: self.imageView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageView.image = toImage },
                                      completion: nil)
                    UIView.transition(with: self.imageBackgroundView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageBackgroundView.image = toImage },
                                      completion: nil)
                    tripNumberLabel.text = String(data[index].number)
                    discriptionLabel.text = data[index].discription + data[index].country + "?"
                    nameLabel.text = data[index].name + ", " + data[index].country
                    countryImage.image = UIImage(named: data[index].flagImage)
                    rupeeLabel.text = "$" + String(data[index].rupee)
                    dispStarts(value: data[index].stars)
                    self.imageView2.alpha = 0
                    imageView2.image = UIImage(named: data[index2].imageName)
                    
                } else{
                    index = 0
                    index2 = 1
                    let toImage = UIImage(named: data[index].imageName)
                    UIView.transition(with: self.imageView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageView.image = toImage },
                                      completion: nil)
                    UIView.transition(with: self.imageBackgroundView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageBackgroundView.image = toImage },
                                      completion: nil)
                    tripNumberLabel.text = String(data[index].number)
                    discriptionLabel.text = data[index].discription + data[index].country + "?"
                    nameLabel.text = data[index].name + ", " + data[index].country
                    countryImage.image = UIImage(named: data[index].flagImage)
                    rupeeLabel.text = "$" + String(data[index].rupee)
                    dispStarts(value: data[index].stars)
                    self.imageView2.alpha = 0
                    imageView2.image = UIImage(named: data[index2].imageName)
                    
                }
                
            } else if card.center.x > (view.frame.width - 75){
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 100, y: card.center.y - 75 )
                    card.alpha = 0
                    self.imageView.alpha = 0
                })
                self.tinderCard.isHidden = true
                self.imageView.isHidden = true
                if index < 3 {
                    index += 1
                    if index2 == 3{
                        index2 = 0
                    } else{
                      index2 += 1
                    }
                    
                    let toImage = UIImage(named: data[index].imageName)
                    UIView.transition(with: self.imageView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageView.image = toImage },
                                      completion: nil)
                    UIView.transition(with: self.imageBackgroundView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageBackgroundView.image = toImage },
                                      completion: nil)
                    tripNumberLabel.text = String(data[index].number)
                    discriptionLabel.text = data[index].discription + data[index].country + "?"
                    nameLabel.text = data[index].name + ", " + data[index].country
                    countryImage.image = UIImage(named: data[index].flagImage)
                    rupeeLabel.text = "$" + String(data[index].rupee)
                    dispStarts(value: data[index].stars)
                    self.imageView2.alpha = 0
                    imageView2.image = UIImage(named: data[index2].imageName)
                    
                } else{
                    index = 0
                    index2 = 1
                    let toImage = UIImage(named: data[index].imageName)
                    UIView.transition(with: self.imageView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageView.image = toImage },
                                      completion: nil)
                    UIView.transition(with: self.imageBackgroundView,
                                      duration:1,
                                      options: .transitionCrossDissolve,
                                      animations: { self.imageBackgroundView.image = toImage },
                                      completion: nil)
                    tripNumberLabel.text = String(data[index].number)
                    discriptionLabel.text = data[index].discription + data[index].country + "?"
                    nameLabel.text = data[index].name + ", " + data[index].country
                    countryImage.image = UIImage(named: data[index].flagImage)
                    rupeeLabel.text = "$" + String(data[index].rupee)
                    dispStarts(value: data[index].stars)
                    self.imageView2.alpha = 0
                    imageView2.image = UIImage(named: data[index2].imageName)
                    
                }
                
            }
            self.tinderCard.isHidden = true
            self.imageView.isHidden = true
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.center!
                self.tinderCard.isHidden = false
                self.imageView.isHidden = false
                self.imageView.alpha = 1
                card.alpha = 1
                self.imageView2.alpha = 0
                card.transform = CGAffineTransform.identity
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveSegue"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.amount = data[index].rupee
            destinationVC.country = data[index].country
        }
        
    }
}
