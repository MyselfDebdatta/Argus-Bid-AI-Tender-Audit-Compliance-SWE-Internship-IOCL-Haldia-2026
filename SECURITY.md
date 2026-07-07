# 🔒 Security Policy

Security is a core pillar of **Argus Bid AI**. Given that this platform processes highly sensitive vendor and procurement data for Public Sector Undertakings (PSUs), we take security vulnerabilities extremely seriously. 🛡️

---

## 🟢 Supported Versions

We currently only support the latest version of Argus Bid AI for security updates. Please ensure you pull the latest commits from the `main` branch before deploying to production.

| Version | Supported          |
| ------- | ------------------ |
| `1.0.x` | ✅ Yes             |
| `< 1.0` | ❌ No              |

---

## 🚨 Reporting a Vulnerability

If you discover a security vulnerability within Argus Bid AI, please **DO NOT** open a public issue. We appreciate your efforts to responsibly disclose your findings.

### Steps to Report 📝
1. Send an email to the project maintainer: **Debdatta Panda** (contact details via GitHub profile/LinkedIn).
2. Include the following details in your report:
   - 📌 **Description:** A clear description of the vulnerability and its potential impact.
   - 🔄 **Reproduction Steps:** Step-by-step instructions on how to reproduce the issue.
   - 💻 **Environment Details:** OS, Python version, and any relevant logs.

### ⏱️ Response Timeline
- You should receive an acknowledgment of your report within **48 hours**.
- We aim to resolve critical security issues within **7 days** of acknowledgment.
- We will keep you updated on the progress and notify you once the issue has been patched and deployed.

---

## 🛡️ Security Best Practices for Deployment
When deploying Argus Bid AI in a live environment, please ensure you follow these practices:
* **🔑 Never Hardcode API Keys:** Always use environment variables (`.env` or server secrets) for `GROQ_API_KEY`.
* **🌐 Secure the Network:** If using Ollama locally, ensure the port (`11434`) is not exposed to the public internet without proper proxy authentication.
* **⚠️ Keep Dependencies Updated:** Regularly run `pip install --upgrade -r requirements.txt` to patch any known vulnerabilities in underlying libraries like `streamlit`, `langchain`, or `pdfplumber`.

Thank you for helping us keep Argus Bid AI secure! 🚀
