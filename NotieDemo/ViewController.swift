//
//  ViewController.swift
//  NotieDemo
//
//  Created by Keaton Burleson on 4/7/16.
//
//

import UIKit
import Notie
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notie = Notie.init(view: self.view, message: "Hello", style: .Input)
        notie.buttonCount = Notie.buttons.single
        notie.leftButtonAction = {
            print(notie.getText())
        }
        notie.show()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
