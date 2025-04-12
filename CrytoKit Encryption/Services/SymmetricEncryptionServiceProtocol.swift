import CryptoKit

protocol SymmetricEncryptionServiceProtocol {
    func generateSymmetricKey() -> SymmetricKey
    func encrypt(message: String, using key: SymmetricKey) -> String?
    func decrypt(encryptedMessage: String, using key: SymmetricKey) -> String?
}

// Test commit
