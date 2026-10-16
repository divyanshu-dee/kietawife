# KIET Wi-Fi Sign in / Sign out

A fast, lightweight, single-file web app to quickly sign in and sign out of the **KIET College Wi-Fi Sophos Captive Portal** (`172.16.16.16:8090`) from any phone, laptop, or tablet.

Each student account allows only 1 active session at a time. This app lets you quickly switch active sessions between your devices or sign in with a single tap.

---

## 📁 Files Included

| File | Purpose |
| :--- | :--- |
| `index.html` | Complete standalone web app (Inline HTML, CSS, JavaScript; 0 external dependencies) |
| `manifest.json` | Web App Manifest for PWA "Add to Home Screen" |
| `sw.js` | Service Worker for offline launch & fast caching |
| `icon.svg` | Scalable vector icon |
| `icon-192.png` | 192×192 PWA launcher icon |
| `icon-512.png` | 512×512 high-resolution splash icon |
| `favicon.ico` | Browser tab icon |

---

## 🚀 How to Deploy on GitHub Pages

You can host this for free on GitHub Pages and access it from any phone or laptop:

1. **Create a GitHub Repository**:
   - Go to [GitHub](https://github.com) and click **New Repository**.
   - Name it (for example: `kiet-wifi` or `wifi`). Set it to **Public**.
2. **Upload the Files**:
   - Upload all files (`index.html`, `manifest.json`, `sw.js`, `icon-192.png`, `icon-512.png`, `icon.svg`, `favicon.ico`) to the root of the repository.
   - Commit changes.
3. **Enable GitHub Pages**:
   - In your repository, click **Settings** (top tab).
   - In the left sidebar, click **Pages**.
   - Under **Build and deployment** → **Source**, select **Deploy from a branch**.
   - Under **Branch**, select `main` (or `master`) and folder `/ (root)`. Click **Save**.
4. **Access your site**:
   - Within 1–2 minutes, GitHub provides your live URL:
     `https://<your-username>.github.io/<repo-name>/`
   - Bookmark this URL on your phone and laptop!

---

## 📱 How to Install as a PWA ("Add to Home Screen")

Once deployed to GitHub Pages (or any HTTPS server):
- **On Android (Chrome / Brave / Edge)**:
  1. Open your GitHub Pages URL.
  2. Tap the three dots (⋮) in the top-right corner.
  3. Tap **"Install app"** or **"Add to Home screen"**.
  4. An app icon named **KIET Wi-Fi** will appear on your home screen. It opens like a native app without browser URL bars.
- **On iOS (Safari)**:
  1. Open your GitHub Pages URL in Safari.
  2. Tap the **Share** button (box with an arrow pointing up).
  3. Scroll down and tap **"Add to Home Screen"**.
  4. Tap **Add** in the top right.

> **Offline Ready**: Because the service worker caches the app shell, the page opens instantly even when you are disconnected from the internet, allowing you to tap **Sign in** right away.

---

## 🧪 How to Test on College Wi-Fi

1. **Connect to KIET Wi-Fi**:
   - Connect your device's Wi-Fi to the college campus network SSID.
   - *Note:* The portal address `http://172.16.16.16:8090` is an internal private IP and is only reachable when connected to college Wi-Fi (it will not connect over mobile data / 4G / 5G or home Wi-Fi).
2. **Open the App**:
   - Open your hosted GitHub Pages site (or open `index.html` locally).
3. **Enter Credentials**:
   - **Internet login ID**: Your college email or student ID (e.g. `name.rollno@kiet.edu` or roll number as registered).
   - **Password**: Your captive portal password.
   - Tick **"Remember on this device"** so you never have to re-type it.
4. **Click "Sign in"**:
   - If opened over HTTPS (GitHub Pages): The app opens a new browser tab with the portal's XML response.
   - If prompted with *"The information you're about to submit is not secure"*, select **"Continue" / "Send anyway"** (this is normal browser behavior when submitting from an HTTPS page to an internal HTTP portal).
   - Return to your original tab or check any website (e.g., `google.com`) to confirm you are online.

---

## 🔍 Understanding Sophos Portal Responses & Troubleshooting

When submitting in HTTPS mode, the captive portal opens in a new tab returning an XML document. Here is how to interpret the portal's messages:

| Portal XML / Message | Meaning | What to do |
| :--- | :--- | :--- |
| `<status>LIVE</status>` or `You are signed in as ...` | **Success!** | You are connected to the internet. Close the reply tab and browse. |
| `You have successfully logged off` | **Logged out!** | Your session was terminated. You can now log in from your other device. |
| `The system could not log you on. Make sure your password is correct` | **Incorrect Password / Username** | Check your credentials. Ensure Caps Lock is off and re-enter password. |
| `Maximum login limit reached` | **Active session exists** | Your account is logged in on another device. Click **Sign out** first (or sign out from the other device), then click **Sign in**. |
| `Data transfer limit reached` | **Quota Exhausted** | Your daily/monthly internet data quota allocated by college admin has ended. |
| `Your account has expired` | **Account Inactive** | Contact the college computer centre / network admin to renew access. |
| `Could not log off user` | **No active session** | The account wasn't currently logged in. |
| Browser shows *Site can't be reached* / *ERR_ADDRESS_UNREACHABLE* | **Not on KIET Wi-Fi** | Ensure you are connected to the campus Wi-Fi network and not on cellular mobile data. |

---

## 🔒 Security & Privacy

- **Zero Third-Party Requests**: No external CDNs, fonts, trackers, or analytics scripts are loaded.
- **Local Storage Only**: If "Remember on this device" is ticked, credentials remain solely inside your browser's local sandbox (`localStorage`). Unticking the box permanently removes them.
- **Direct Submission**: Credentials are sent directly to `http://172.16.16.16:8090/login.xml` and nowhere else.
