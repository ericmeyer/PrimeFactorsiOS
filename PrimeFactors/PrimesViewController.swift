import UIKit

@objc public protocol PrimesView {
    func clear()
    func show(primes: [Int])
    func inputWasNotANumber(input: String)
}
public class PrimesLabel: UILabel, PrimesView {

    public func clear() {
        text = ""
    }

    public func show(primes: [Int]) {
        text = primes.map { "\($0)" }.joined(separator: ", ")
    }

    public func inputWasNotANumber(input: String) {
        text = "\"\(input)\" is not a number"
    }


}
public class PrimesViewController: UIViewController {

    @IBOutlet weak public var numberToFactorTextField: UITextField!
    @IBOutlet weak public var primesView: PrimesView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        primesView.clear()
    }

    @IBAction public func generatePrimes() {
        if let number: Int = Int(numberToFactorTextField.text!) {
            primesView.show(primes: PrimeFactors.generate(number: number))
        } else {
            primesView.inputWasNotANumber(input: numberToFactorTextField.text!)
        }
    }

}
