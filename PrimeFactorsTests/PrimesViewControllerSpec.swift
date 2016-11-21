import Quick
import Nimble
import PrimeFactors

class PrimesViewControllerSpec: QuickSpec {
    override func spec() {

        var primesLabel: UILabel!
        var controller: PrimesViewController!
        var numberInput: UITextField!

        beforeEach {
            primesLabel = UILabel()
            controller = PrimesViewController()
            controller.primesLabel = primesLabel
            numberInput = UITextField()
            controller.numberToFactorTextField = numberInput
        }

        describe("Loading the view") {
            it("clears the current primes") {
                primesLabel.text = "Original text"

                controller.viewDidLoad()

                expect(primesLabel.text).to(equal(""))
            }
        }

        describe("Generating prime factors") {
            it("displays the results in a label") {
                numberInput.text = "\(2*2*3*5)"

                controller.generatePrimes()

                expect(primesLabel.text).to(equal("2, 2, 3, 5"))
            }

            it("shows an error when the input is not a number") {
                numberInput.text = "ABC"

                controller.generatePrimes()

                expect(primesLabel.text).to(equal("\"ABC\" is not a number"))
            }
        }
    }
}
