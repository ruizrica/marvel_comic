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
        DispatchQueue.main.async {
            let comic = Comic()
            comic.modalPresentationStyle = .formSheet
            self.present(comic, animated: true, completion: nil)
        }
    }
}
