import Quick
import Nimble
import PrimeFactors

class MockPrimesView: PrimesView {
    var visiblePrimes: [Int] = []
    var isErrorVisible = false
    func clear() {
        visiblePrimes = []
    }
    func show(primes: [Int]) {
        visiblePrimes = primes
    }
    func inputWasNotANumber(input: String) {
        isErrorVisible = true
    }
}
class PrimesViewControllerSpec: QuickSpec {
    override func spec() {

        var primesView: MockPrimesView!
        var controller: PrimesViewController!
        var numberInput: UITextField!

        beforeEach {
            primesView = MockPrimesView()
            controller = PrimesViewController()
            controller.primesView = primesView
            numberInput = UITextField()
            controller.numberToFactorTextField = numberInput
        }

        describe("Loading the view") {
            it("clears the current primes") {
                primesView.visiblePrimes = [1, 2, 3]

                controller.viewDidLoad()

                expect(primesView.visiblePrimes).to(equal([]))
            }
        }

        describe("Generating prime factors") {
            it("displays the results in a label") {
                numberInput.text = "\(2*2*3*5)"

                controller.generatePrimes()

                expect(primesView.visiblePrimes).to(equal([2, 2, 3, 5]))
            }

            it("shows an error when the input is not a number") {
                numberInput.text = "ABC"

                controller.generatePrimes()

                expect(primesView.isErrorVisible).to(be(true))
            }
        }
    }
}
