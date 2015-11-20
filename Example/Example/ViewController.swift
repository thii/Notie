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
        let notie = Notie.sharedNotie
        notie.show(self.view, message: "Are you sure you want to do that?", withInputField: false, placeholder: nil, leftButtonTitle: "Yes", rightButtonTitle: "No", leftButtonBlock: { () -> () in
            // Left button handler
            notie.dismiss()
            }) { () -> () in
            // Right button handler
            notie.dismiss()
        }
    }

    @IBAction func showInputNotie(sender: AnyObject) {
        let notie = Notie.sharedNotie
        notie.show(self.view, message: "Please enter your email address", withInputField: true, placeholder: "email@example.com", leftButtonTitle: "Submit", rightButtonTitle: "Cancel", leftButtonBlock: { () -> () in
            // Left button handler
            notie.dismiss()
            }) { () -> () in
            // Right button handler
            notie.dismiss()
        }
    }

    @IBAction func hideNotie(sender: AnyObject) {
        let notie = Notie.sharedNotie
        notie.dismiss()
    }
}
