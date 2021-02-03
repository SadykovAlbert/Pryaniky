//
//  ViewController.swift
//  demo123
//
//  Created by Альберт Садыков on 01.02.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var p: Priniky?
    var viewMas:[String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            NetworkManager.getRequest { (priniky) in
                
                self.p = priniky
            }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == "main" else {return}
        let vc = segue.destination as! PrViewController
        vc.p = p
        vc.viewMas = p!.view
        
    }
    
}
