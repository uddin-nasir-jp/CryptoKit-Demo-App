import CryptoKit
import SwiftUI

// Service for asymmetric cryptographic key pair operations and signature verification.
class KeyPairService: KeyPairServiceProtocol {
    func generateKeyPair() -> (privateKey: Curve25519.Signing.PrivateKey, publicKey: Curve25519.Signing.PublicKey) {
        let privateKey = Curve25519.Signing.PrivateKey()
        return (privateKey, privateKey.publicKey)
    }

    func sign(message: String, using privateKey: Curve25519.Signing.PrivateKey) -> String? {
        let messageData = Data(message.utf8)
        let signature = try? privateKey.signature(for: messageData)
        return signature?.base64EncodedString()
    }

    func verify(signature: String, for message: String, using publicKey: Curve25519.Signing.PublicKey) -> Bool {
        guard let signatureData = Data(base64Encoded: signature) else { return false }
        let messageData = Data(message.utf8)
        return publicKey.isValidSignature(signatureData, for: messageData)
    }
}
