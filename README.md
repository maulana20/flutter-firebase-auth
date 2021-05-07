# flutter-firebase-auth
sample demo authentication flow flutter with firebase [sumber](https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/)

## Getting Started
pada kali ini kita daftarkan dahulu aplikasi untuk bisa akses pada [firebase](https://console.firebase.google.com/)

contoh : `com.example.flutter_firebase_auth`

### 1. Firebase Configuration
Untuk mengaktifkan service firebase pada aplikasi, perlu menambahkan plugin google ke dalam file `gradle`

`android/build.gradle`
```bash
dependencies {
    // Add this line
    classpath 'com.google.gms:google-services:4.3.5'
```
`android/app/build.gradle`
```bash
// Add this line
apply plugin: 'com.google.gms.google-services'

dependencies {
    // Add this line
    implementation platform('com.google.firebase:firebase-bom:27.1.0')
    implementation 'com.google.firebase:firebase-analytics'
```
kemudian jalankan
```bash
flutter packages get
```

### 2. Install
`pubspec.yaml`
```bash
dependencies:
  firebase_core: ^0.7.0
  firebase_auth: ^0.20.0+1
  google_sign_in: 4.0.0
```
kemudian jalankan
```bash
flutter pub get
```

### 3. Directory
```bash
❏ lib
    ❏ res
        ❏ custom_colors.dart
    ❏ screens
        ❏ sign_in_screen.dart
        ❏ user_info_screen.dart
    ❏ utils
        ❏ authentication.dart
    ❏ widgets
        ❏ google_sign_in_button.dart
    ❏ main.dart
❏ assets
    ❏ firebase_logo.png
    ❏ google_logo.png
```

### 4. Note
Masih terkendala saat sign google pada firebase dikarenakan harus mendaftarkan keystore ke dalam firebase [sumber](https://codewithandrea.com/articles/keytool-command-not-found-how-to-fix-windows-macos/) berupa `SHA-1 certificate fingerprint`

![signinscreen](https://github.com/maulana20/flutter-firebase-auth/blob/main/screen/signinscreen.jpg)

![googleauth](https://github.com/maulana20/flutter-firebase-auth/blob/main/screen/googleauth.jpg)
