import CryptoKit
import SwiftUI

protocol KeyPairServiceProtocol {
    func generateKeyPair() -> (privateKey: Curve25519.Signing.PrivateKey, publicKey: Curve25519.Signing.PublicKey)
    func sign(message: String, using privateKey: Curve25519.Signing.PrivateKey) -> String?
    func verify(signature: String, for message: String, using publicKey: Curve25519.Signing.PublicKey) -> Bool
}
