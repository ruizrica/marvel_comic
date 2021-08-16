//
//  Comic.swift
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

import Foundation
import UIKit

class Comic: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func setupUI(payload: NSDictionary) {
        
        // Loaded from Theme
        drawUI_comicMain(parent: view, payload: payload)
    }
}
