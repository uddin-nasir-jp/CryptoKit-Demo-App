import CryptoKit
import SwiftUI

// Service for generating cryptographic hashes using SHA256 and SHA512.
class HashingService: HashingServiceProtocol {
    func generateSHA256Hash(for input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }

    func generateSHA512Hash(for input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA512.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}
