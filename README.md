# Flutter Web Project

This is a Flutter web application built using the latest stable version of Flutter.

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter installed on your machine ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Dart SDK (comes with Flutter)
- Git

### ✅ Check Flutter Installation

```bash
flutter doctor
```

Make sure all dependencies are resolved.

---

## 🔧 Project Setup

### 1. Clone the Repository

```bash
git clone https://github.com/reddyps/Landmark-Assignment-E-Commerce-App
cd YOUR_REPO_NAME
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run on Web

```bash
flutter run -d chrome --web-browser-flag "--disable-web-security"
```

---

## 🌐 Hosting (Optional: GitHub Pages)

If you want to deploy your app to GitHub Pages:

### 1. Build Web Output

```bash
flutter build web
```

### 2. Configure GitHub Pages

- Ensure `web` output is in the `build/web` directory.
- In `index.html`, set the correct `<base href="/">`:
  - For GitHub Pages: `<base href="/REPO_NAME/">`

### 3. Push to `gh-pages` Branch

You can use the [`flutter-gh-pages`](https://pub.dev/packages/flutter_web) tool or do it manually:

```bash
# Optional: install gh-pages CLI globally
npm install -g gh-pages

# Deploy to GitHub Pages
gh-pages -d build/web
```

Or push manually:

```bash
git checkout --orphan gh-pages
git reset --hard
git add build/web -f
git commit -m "Deploy to GitHub Pages"
git subtree push --prefix build/web origin gh-pages
```

---

## 📦 Pushing to GitHub

### Initial Commit

```bash
git init
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git add .
git commit -m "Initial commit"
git push -u origin main
```

---

## 📁 Directory Structure

```text
lib/            # Main Dart source files
web/            # Web-specific files like index.html
build/          # Generated folder after build
assets/         # Images, fonts, etc.
```

---

## 👨‍💻 Author

- **Your Name** – [your-username](https://github.com/your-username)

---

## 📄 License

This project is licensed under the MIT License.
