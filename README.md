
# CryptoKit Demo App

This project is a demonstration of various cryptographic operations using Apple's CryptoKit framework, built with SwiftUI. The project adheres to MVVM architecture and SOLID principles, making it a robust and maintainable solution.

## Features Covered

- **SHA256 and SHA512 Hashing:** Generate secure cryptographic hashes.
- **Symmetric Key Encryption and Decryption:** Secure messages using AES-GCM encryption.
- **Asymmetric Key Pair Generation:** Create Curve25519 cryptographic key pairs.
- **Digital Signing and Verification:** Sign messages and verify their authenticity.

## Technologies Used

- **CryptoKit:** Secure cryptographic functions.
- **SwiftUI:** Modern declarative UI framework.
- **MVVM Architecture:** Separation of concerns.
- **SOLID Principles:** Ensures scalable and maintainable code.
- **Swift Macros:** Utilizes `@Observable` for state management.

## Project Structure

```
CryptoKitDemoApp
├── Models
├── Services
├── ViewModels
├── Views
└── Tests
```
- **Models:** Data structures for cryptographic operations.
- **Services:** Handle cryptographic operations following SOLID principles.
- **ViewModels:** State management and business logic.
- **Views:** User interface components.
- **Tests:** Unit tests covering all CryptoKit operations.

## Key Usage Examples

### Hashing
```swift
viewModel.hashInputSHA256(input: "Hello World")
print(viewModel.dataModel.hashResultSHA256)
```

### Symmetric Encryption and Decryption
```swift
viewModel.generateSymmetricKey()
viewModel.encryptMessage("Sensitive Data")
viewModel.decryptMessage()
```

### Key Pair Generation and Signing
```swift
viewModel.generateKeyPair()
viewModel.signMessage("Secure Message")
viewModel.verifySignature("Secure Message")
```

## Unit Tests
The project includes a comprehensive set of unit tests to validate all cryptographic operations. To run the tests:

1. Select the test target scheme.
2. Run the tests by pressing **Cmd + U**.

## Security Considerations
- Keys are securely managed and never stored in plaintext.
- AES-GCM provides both encryption and integrity verification.

## Contribution
Contributions are welcome! Feel free to fork the project, create a feature branch, and submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Acknowledgments
- Apple CryptoKit Documentation: [CryptoKit Overview](https://developer.apple.com/documentation/cryptokit)

