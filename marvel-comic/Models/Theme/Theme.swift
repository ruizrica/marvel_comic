//
//  Theme.swift
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

import Foundation
import UIKit

func drawUI_mainButton(parent: UIView) -> UIButton {
    
    // Local Constants
    let sWidth = parent.bounds.size.width
    let sHeight = parent.bounds.size.height
    let buttonHeight = 120.0
    parent.backgroundColor = .darkGray.withAlphaComponent(0.7)
    
    // Main Button
    let button =  UIButton(frame: CGRect(x: 0.0,y: Double(sHeight)-buttonHeight,width: Double(sWidth),height: buttonHeight))
    button.backgroundColor = #colorLiteral(red: 0.9280343652, green: 0.1151924059, blue: 0.1440678835, alpha: 1)
    button.setTitle("Load Comic", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name:"AvenirNextCondensed-BoldItalic", size: 26.0)
    parent.addSubview(button)
    
    // Credits
    return button
}

func drawUI_comicMain_mockup(parent: UIView) {
    
    // Local Constants
    let sWidth = Int(parent.bounds.size.width)
    let topBarHeight = 480
    let posterWidth = 260
    let posterHeight = 400
    let titleHeight = 25
    let textWidth = sWidth-20
    let descriptionHeight = 170

    parent.backgroundColor = .black.withAlphaComponent(0.7)
    
    let topBar = UIView(frame: CGRect(x:0,y:0,width:sWidth,height:topBarHeight))
    topBar.backgroundColor = #colorLiteral(red: 0.9280343652, green: 0.1151924059, blue: 0.1440678835, alpha: 1)
    
    let imageCover = UIImageView(frame: CGRect(x:0,y:0,width:sWidth,height:topBarHeight))
    imageCover.backgroundColor = .darkGray
    imageCover.contentMode = .scaleAspectFill
    imageCover.clipsToBounds = true
    imageCover.layer.opacity = 0.1
    
    // TEST ONLY
    imageCover.image = UIImage(named: "test_image")
    
    topBar.addSubview(imageCover)
    parent.addSubview(topBar)
    
    let posterFrame = UIImageView(frame: CGRect(x:(sWidth/2)-(posterWidth/2),y:20,width:posterWidth,height:posterHeight))
    posterFrame.backgroundColor = .darkGray
    posterFrame.contentMode = .scaleAspectFit

    // TEST ONLY
    posterFrame.image = UIImage(named: "test_image")

    parent.addSubview(posterFrame)
    
    let title = UILabel(frame: CGRect(x:0,
                                      y:440,
                                      width:sWidth,
                                      height:titleHeight))
    title.font = UIFont(name:"AvenirNextCondensed-BoldItalic", size: 19.0)
    title.text = "default text"
    title.textAlignment = .center
    
    // TEST ONLY
    title.text = "The Amazing Spider-Man (1963) #359"
    
    parent.addSubview(title)
    
    let description = UITextView(frame: CGRect(x:(sWidth/2)-(textWidth/2),
                                               y:490,
                                               width:textWidth,
                                               height:descriptionHeight))
    description.backgroundColor = .clear
    description.font = UIFont(name:"AvenirNextCondensed-BoldItalic", size: 16.0)
    description.textColor = .white.withAlphaComponent(0.8)
    description.isEditable = false
    
    // TEST ONLY
    description.text = "The deeply misguided Cardiac is causing headache for Spider-Man, taking to the streets with a new brand of vigilantism. Will Spider-Man be able to prevent the reckless destruction of the TechToy factory? The return of Cletus Kasady, stirring up trouble on Ryker's Island as only a true thug can!"
        
    parent.addSubview(description)
    
}

func drawUI_comicMain(parent: UIView) {
    
    // Local Constants
    let sWidth = Int(parent.bounds.size.width)
    let topBarHeight = 480
    let posterWidth = 260
    let posterHeight = 400
    let titleHeight = 25
    let textWidth = sWidth-20
    let descriptionHeight = 170

    parent.backgroundColor = .black.withAlphaComponent(0.7)
    
    let topBar = UIView(frame: CGRect(x:0,y:0,width:sWidth,height:topBarHeight))
    topBar.backgroundColor = #colorLiteral(red: 0.9280343652, green: 0.1151924059, blue: 0.1440678835, alpha: 1)
    
    let imageCover = UIImageView(frame: CGRect(x:0,y:0,width:sWidth,height:topBarHeight))
    imageCover.backgroundColor = .darkGray
    imageCover.contentMode = .scaleAspectFill
    imageCover.clipsToBounds = true
    imageCover.layer.opacity = 0.1
    
    // Load Remote Image
    imageCover.image = UIImage(named: "test_image")
    
    topBar.addSubview(imageCover)
    parent.addSubview(topBar)
    
    let posterFrame = UIImageView(frame: CGRect(x:(sWidth/2)-(posterWidth/2),y:20,width:posterWidth,height:posterHeight))
    posterFrame.backgroundColor = .darkGray
    posterFrame.contentMode = .scaleAspectFit
    
    // Load Remote Image
    posterFrame.image = UIImage(named: "test_image")
    parent.addSubview(posterFrame)
    
    let title = UILabel(frame: CGRect(x:0,
                                      y:440,
                                      width:sWidth,
                                      height:titleHeight))
    title.font = UIFont(name:"AvenirNextCondensed-BoldItalic", size: 19.0)
    title.text = "default text"
    title.textAlignment = .center
    title.text = "default_text"
    parent.addSubview(title)
    
    let description = UITextView(frame: CGRect(x:(sWidth/2)-(textWidth/2),
                                               y:490,
                                               width:textWidth,
                                               height:descriptionHeight))
    description.backgroundColor = .clear
    description.font = UIFont(name:"AvenirNextCondensed-BoldItalic", size: 16.0)
    description.textColor = .white.withAlphaComponent(0.8)
    description.isEditable = false
    description.text = "default_text"
        
    parent.addSubview(description)
    
}
