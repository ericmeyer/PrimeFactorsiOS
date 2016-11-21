import Quick
import Nimble
import PrimeFactors

class ViewControllerSpec: QuickSpec {
    override func spec() {

        var primes: UILabel!
        var controller: ViewController!
        var numberInput: UITextField!

        beforeEach {
            primes = UILabel()
            controller = ViewController()
            controller.primes = primes
            numberInput = UITextField()
            controller.numberToFactorTextField = numberInput
        }

        describe("Loading the view") {
            it("clears the current primes") {
                primes.text = "Original text"

                controller.viewDidLoad()

                expect(primes.text).to(equal(""))
            }
        }

        describe("Generating prime factors") {
            it("displays the results in a label") {
                numberInput.text = "\(2*2*3*5)"

                controller.generatePrimes()

                expect(primes.text).to(equal("2, 2, 3, 5"))
            }

            it("shows an error when the input is not a number") {
                numberInput.text = "ABC"

                controller.generatePrimes()

                expect(primes.text).to(equal("Please enter a number"))
            }
        }
    }
}
