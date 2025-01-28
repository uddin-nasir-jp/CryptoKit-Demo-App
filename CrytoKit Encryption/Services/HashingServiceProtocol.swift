import CryptoKit
import SwiftUI

// Protocols for Cryptographic Operations to follow the SOLID design principles.
protocol HashingServiceProtocol {
    func generateSHA256Hash(for input: String) -> String
    func generateSHA512Hash(for input: String) -> String
}
