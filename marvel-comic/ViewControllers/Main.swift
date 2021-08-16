//
//  Main.swift
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Loaded from Theme
        let button = drawUI_mainButton(parent: view)
        button.addTarget(self, action: #selector(showComic), for: .touchUpInside)
    }

    @objc func showComic() {
        
        // Block From Objetive-C
        API.loadComic { comic in
            let comicbook = comic as NSDictionary
            DispatchQueue.main.async {
                let comic = Comic()
                comic.setupUI(payload: comicbook)
                comic.modalPresentationStyle = .formSheet
                self.present(comic, animated: true, completion: nil)
            }
        }
    }
}
