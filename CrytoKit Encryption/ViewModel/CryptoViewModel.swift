//import CryptoKit
import SwiftUI

@Observable
class CryptoViewModel {
    var dataModel = CryptoDataModel()

    private let hashingService: HashingServiceProtocol
    private let encryptionService: SymmetricEncryptionServiceProtocol
    let keyPairService: KeyPairServiceProtocol

    init(hashingService: HashingServiceProtocol = HashingService(),
         encryptionService: SymmetricEncryptionServiceProtocol = SymmetricEncryptionService(),
         keyPairService: KeyPairServiceProtocol = KeyPairService()) {
        self.hashingService = hashingService
        self.encryptionService = encryptionService
        self.keyPairService = keyPairService
    }

    // Hashes the input text using SHA256.
    func hashInputSHA256(input: String) {
        dataModel.hashResultSHA256 = hashingService.generateSHA256Hash(for: input)
    }

    // Hashes the input text using SHA512.
    func hashInputSHA512(input: String) {
        dataModel.hashResultSHA512 = hashingService.generateSHA512Hash(for: input)
    }

    // Generates a symmetric key for encryption.
    func generateSymmetricKey() {
        let key = encryptionService.generateSymmetricKey()
        dataModel.symmetricKey = key
        dataModel.symmetricKeyBase64 = key.withUnsafeBytes { Data(Array($0)).base64EncodedString() }
    }

    // Encrypts a message using the generated symmetric key.
    func encryptMessage(_ message: String) {
        guard let key = dataModel.symmetricKey else { return }
        dataModel.encryptedMessageBase64 = encryptionService.encrypt(message: message, using: key)
    }

    // Decrypts an encrypted message using the same symmetric key.
    func decryptMessage() {
        guard let key = dataModel.symmetricKey, let encryptedMessage = dataModel.encryptedMessageBase64 else { return }
        dataModel.decryptedMessage = encryptionService.decrypt(encryptedMessage: encryptedMessage, using: key)
    }

    // Generates a cryptographic key pair.
    func generateKeyPair() {
        let keyPair = keyPairService.generateKeyPair()
        dataModel.privateKey = keyPair.privateKey
        dataModel.publicKey = keyPair.publicKey
        dataModel.publicKeyBase64 = keyPair.publicKey.rawRepresentation.base64EncodedString()
    }

    // Signs a message using the private key.
    func signMessage(_ message: String) {
        guard let privateKey = dataModel.privateKey else { return }
        dataModel.signatureBase64 = keyPairService.sign(message: message, using: privateKey)
    }

    // Verifies the signature of a message using the public key.
    func verifySignature(_ message: String) {
        guard let publicKey = dataModel.publicKey, let signature = dataModel.signatureBase64 else { return }
        let result = keyPairService.verify(signature: signature, for: message, using: publicKey)
        dataModel.verificationResult = result ? "Signature is valid." : "Signature is invalid."
    }
}
