import Notie
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNotie(sender: AnyObject) {
        let notie = Notie(view: self.view, message: "Are you sure you want to do that?", style: .Confirm)



        notie.leftButtonAction = {
            notie.dismiss()
        }

        notie.rightButtonAction = {

            notie.dismiss()
        }

        notie.show()
    }

    @IBAction func showInputNotie(sender: AnyObject) {
        let notie = Notie(view: self.view, message: "Please enter your email address", style: .Input)
        notie.placeholder = "email@example.com"
        notie.buttonCount = Notie.buttons.standard
        notie.leftButtonAction = {
            print(notie.getText())
            notie.dismiss()
        }

        notie.rightButtonAction = {
            notie.dismiss()
        }
        
        notie.show()
    }

}
