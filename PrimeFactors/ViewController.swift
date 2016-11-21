import UIKit

public class ViewController: UIViewController {

    @IBOutlet weak public var numberToFactorTextField: UITextField!
    @IBOutlet weak public var primesLabel: UILabel!

    public override func viewDidLoad() {
        super.viewDidLoad()
        primesLabel.text = ""
    }

    @IBAction public func generatePrimes() {
        if let number: Int = Int(numberToFactorTextField.text!) {
            primesLabel.text = PrimeFactors.generate(number: number).map { "\($0)" }.joined(separator: ", ")
        } else {
            primesLabel.text = "Please enter a number"
        }
    }

}
