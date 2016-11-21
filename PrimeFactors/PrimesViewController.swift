import UIKit

class PrimesPresenter {
    let view: PrimesView
    init(view: PrimesView) {
        self.view = view
    }
    func generatePrimes(input: String) {
        if let number: Int = Int(input) {
            let primes = PrimeFactors.generate(number: number)
            view.show(primes: primes)
        } else {
            view.showErrorMessage(input: input)
        }
    }
}
protocol PrimesView {
    func show(primes: [Int])
    func showErrorMessage(input: String)
    func waitingForInput()
}
public class PrimesViewController: UIViewController, PrimesView {

    @IBOutlet weak public var numberToFactorTextField: UITextField!
    @IBOutlet weak public var primesLabel: UILabel!

    var primesPresenter: PrimesPresenter?

    public override func viewDidLoad() {
        super.viewDidLoad()
        primesPresenter = PrimesPresenter(view: self)
        waitingForInput()
    }

    @IBAction public func generatePrimes() {
        primesPresenter?.generatePrimes(input: numberToFactorTextField.text!)
    }

    func waitingForInput() {
        primesLabel.text = ""
    }

    func show(primes: [Int]) {
        primesLabel.text = primes.map { "\($0)" }.joined(separator: ", ")
    }

    func showErrorMessage(input: String) {
        primesLabel.text = "\"\(input)\" is not a number"
    }

}
