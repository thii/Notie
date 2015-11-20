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
        notie.show(self.view, message: "Are you sure you want to do that?", leftButtonTitle: "Yes", rightButtonTitle: "No", leftButtonBlock: { () -> () in
            print("Left")
            }) { () -> () in
            print("Right")
        }
    }

    @IBAction func hideNotie(sender: AnyObject) {
        let notie = Notie.sharedNotie
        notie.dismiss()
    }
}
