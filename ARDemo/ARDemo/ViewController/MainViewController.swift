//
//  MainViewController.swift
//  ARDemo
//
//  Created by Глеб Писарев on 13.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var model: ModelType = .void
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func paimoAction(_ sender: Any) {
        self.model = .paimio
    }
    @IBAction func dragonAction(_ sender: Any) {
        self.model = .dragon
    }
    @IBAction func kratosAction(_ sender: Any) {
        self.model = .kratos
    }
    @IBAction func voidAction(_ sender: Any) {
        self.model = .void
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewerViewController
        viewController.model = self.model
    }
}
