import Quick
import Nimble
import PrimeFactors

class ViewControllerSpec: QuickSpec {
    override func spec() {

        describe("Loading the view") {
            it("clears the current primes") {
                let primes = UILabel()
                primes.text = "Original text"
                let controller = ViewController()
                controller.primes = primes

                controller.viewDidLoad()

                expect(primes.text).to(equal(""))
            }
        }

        describe("Generating prime factors") {
            it("displays the results in a label") {
                let primes = UILabel()
                let numberInput = UITextField()
                let controller = ViewController()
                controller.primes = primes
                controller.numberToFactorTextField = numberInput
                numberInput.text = "\(2*2*3*5)"

                controller.generatePrimes()

                expect(primes.text).to(equal("2, 2, 3, 5"))
            }

            it("shows an error when the input is not a number") {
                let primes = UILabel()
                let numberInput = UITextField()
                let controller = ViewController()
                controller.primes = primes
                controller.numberToFactorTextField = numberInput
                numberInput.text = "ABC"

                controller.generatePrimes()

                expect(primes.text).to(equal("Please enter a number"))
            }
        }
    }
}
