
import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = "Covid-19"
        
        alphaAnimation ()

    }
    
    func alphaAnimation () {
        
        self.loginLabel.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            
            self.loginLabel.alpha = 1
        },
                       completion:{ (true) in
            self.performSegue(withIdentifier: "start", sender: nil)
        }  )
    }

  

}
