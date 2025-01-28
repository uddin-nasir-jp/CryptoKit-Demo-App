
import XCTest
@testable import CrytoKit_Encryption

final class CrytoKit_EncryptionTests: XCTestCase {

    var viewModel: CryptoViewModel!

        // MARK: - Setup and Teardown

        override func setUp() {
            super.setUp()
            viewModel = CryptoViewModel()
        }

        override func tearDown() {
            viewModel = nil
            super.tearDown()
        }

        // MARK: - Test Cases

        func testSHA256Hashing() {
            let input = "Hello, World!"
            viewModel.hashInputSHA256(input: input)
            XCTAssertNotNil(viewModel.dataModel.hashResultSHA256)
            XCTAssertEqual(viewModel.dataModel.hashResultSHA256?.count, 64)
        }

        func testSHA512Hashing() {
            let input = "Hello, World!"
            viewModel.hashInputSHA512(input: input)
            XCTAssertNotNil(viewModel.dataModel.hashResultSHA512)
            XCTAssertEqual(viewModel.dataModel.hashResultSHA512?.count, 128)
        }

        func testSymmetricEncryptionAndDecryption() {
            let message = "Sensitive Data"
            viewModel.generateSymmetricKey()
            viewModel.encryptMessage(message)
            let encryptedMessage = viewModel.dataModel.encryptedMessageBase64
            XCTAssertNotNil(encryptedMessage)
            viewModel.decryptMessage()
            XCTAssertEqual(viewModel.dataModel.decryptedMessage, message)
        }

        func testEncryptionWithWrongKey() {
            let message = "Sensitive Data"
            viewModel.generateSymmetricKey()
            viewModel.encryptMessage(message)
            let encryptedMessage = viewModel.dataModel.encryptedMessageBase64

            let newViewModel = CryptoViewModel()
            newViewModel.generateSymmetricKey() // Generates a different key
            newViewModel.dataModel.encryptedMessageBase64 = encryptedMessage
            newViewModel.decryptMessage()

            XCTAssertNotEqual(newViewModel.dataModel.decryptedMessage, message)
        }

        func testInvalidSignatureVerification() {
            viewModel.generateKeyPair()
            let message = "Important Message"
            viewModel.signMessage(message)
            let invalidMessage = "Tampered Message"

            guard let signature = viewModel.dataModel.signatureBase64,
                  let publicKey = viewModel.dataModel.publicKey else {
                XCTFail("Signature or public key is missing")
                return
            }

            let isVerified = viewModel.keyPairService.verify(
                signature: signature,
                for: invalidMessage,
                using: publicKey
            )

            XCTAssertFalse(isVerified)
        }

}
