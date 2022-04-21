import UIKit

class InputPage: UIViewController {
    @IBOutlet weak var input_TXT_player1: UITextField!
    @IBOutlet weak var input_TXT_player2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameView=segue.destination as? ViewController {
            gameView.player1_name = input_TXT_player1.text
            gameView.player2_name = input_TXT_player2.text
        }
    }
    
    
    @IBAction func registerClick(_ sender: Any) {
        if(input_TXT_player1.hasText && input_TXT_player2.hasText) {
        performSegue(withIdentifier: "con", sender: sender)
        }
    }
}
