import Quick
import Nimble
import PrimeFactors

class PrimeFactorsSpec: QuickSpec {
    override func spec() {

        describe("Generating prime factors") {
            it("has none for 1") {
                expect(PrimeFactors.generate(number: 1)).to(equal([]))
            }

            it("factors 2") {
                expect(PrimeFactors.generate(number: 2)).to(equal([2]))
            }

            it("factors 3") {
                expect(PrimeFactors.generate(number: 3)).to(equal([3]))
            }

            it("factors 4") {
                expect(PrimeFactors.generate(number: 4)).to(equal([2, 2]))
            }

            it("factors 8") {
                expect(PrimeFactors.generate(number: 8)).to(equal([2, 2, 2]))
            }

            it("factors 9") {
                expect(PrimeFactors.generate(number: 9)).to(equal([3, 3]))
            }
        }

    }
}
