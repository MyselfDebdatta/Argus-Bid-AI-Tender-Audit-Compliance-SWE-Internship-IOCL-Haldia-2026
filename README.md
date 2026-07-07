<div align="center">

# <img src="logo.jpg" alt="Argus Bid AI Logo" width="40" style="vertical-align: -8px; margin-right: 10px; border-radius: 8px;"> Argus Bid AI — Tender Audit & Compliance

**A production-grade, deterministic AI-driven tender auditing and compliance platform for PSUs.**

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Streamlit](https://img.shields.io/badge/Streamlit-%23FE4B4B.svg?style=for-the-badge&logo=streamlit&logoColor=white)
![Ollama](https://img.shields.io/badge/Ollama-%23000000.svg?style=for-the-badge&logo=ollama&logoColor=white)
![Groq](https://img.shields.io/badge/Groq-%23F55036.svg?style=for-the-badge&logo=groq&logoColor=white)
![Render](https://img.shields.io/badge/Render-%2346E3B7.svg?style=for-the-badge&logo=render&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

[Report Bug](https://github.com/MyselfDebdatta/Argus-Bid-AI-Tender-Audit-Compliance/issues) · [Request Feature](https://github.com/MyselfDebdatta/Argus-Bid-AI-Tender-Audit-Compliance/issues)

</div>

---

**Argus Bid AI** is a highly auditable and visually spectacular AI-driven Tender Auditing & Compliance Platform. Built specifically for Public Sector Undertakings (PSUs) like IOCL, it automates the tedious, manual process of validating vendor submissions against complex Master BID/NIT (Notice Inviting Tender) documents. It ensures rapid, bias-free evaluations while maintaining strict legal defensibility through deterministic rule-engines.

---

## 🏢 Academic & Industrial Context

<div align="center">
  <img src="iocl_logo.png" alt="Indian Oil Corporation Limited Logo" width="180" style="margin-top: 10px; margin-bottom: 20px;">
</div>

> [!NOTE]
> This platform was engineered as part of a **Software Engineering (SWE) Summer Internship** at **Indian Oil Corporation Limited (IOCL), Haldia Refinery** during my first year, second semester (June 15th, 2026 – July 13th, 2026).

> [!IMPORTANT]
> 👤 **Role & Authorship:** I am the **sole developer and exclusive contributor** to this project. I independently engineered the entire platform from scratch, encompassing all core architecture, frontend design, and backend logic.
> 
> 🏢 **Guidance & Compliance:** The architectural design, project structure, and enterprise compliance standards were developed under the expert guidance and explicit instructions of my supervisors in the **Information Systems (IS) Department** at IOCL, Haldia Refinery. Their mentorship was instrumental in ensuring the tool meets the rigorous demands of public sector procurement.

---

## 🎯 Executive Overview

### 🚨 The Problem
Procurement evaluation is traditionally a manual bottleneck. Officers must manually cross-reference hundreds of pages of vendor submissions against strict Pre-Qualification Criteria (PQC), Mandatory Documents (MAFs, EMDs), and Technical Specifications. This process is slow, prone to human error, and lacks instant auditability. Black-box AI tools cannot be used because they hallucinate and lack the strict deterministic traceability required for public procurement.

### 💡 The Solution
Argus Bid AI transforms procurement from a manual chore into an instant, deterministic, and auditable process. By acting as a strict compliance gate, it extracts the matrix of requirements from the Master BID and cross-matches it against every vendor's submission. 

### ✨ Tech Innovations
- **Deterministic Rule Engine:** Unlike generative AI that hallucinate, Argus Bid AI relies on strict logic to evaluate pass/fail compliance.
- **Explainable Audit Trails (XAI):** Every single decision, rank, or disqualification is backed by a legally defensible, traceable text snippet.
- **Dual-Model Hybrid RAG Augmentation:** Employs an ultra-secure local Ollama engine for air-gapped processing, alongside a lightning-fast Groq cloud fallback leveraging a dual-model architecture (`70B` and `8B` models) to balance intelligence and rate limits.
- **Dynamic Multi-modal OCR:** Extracts text and tables effortlessly.

### 🧩 Core Product Modules
- **Compliance Engine:** Evaluates PQC, MAFs, and Mandatory Documents based on extracted constraints using a 100% deterministic token-overlap regex engine, completely eliminating AI hallucinations.
- **Comparative Matrix:** Automatically generates side-by-side technical comparison tables for all responsive bidders.
- **Interactive Dashboard:** A premium, glassmorphic UI for uploading documents, running audits, and viewing explainable results.
- **Double-Confirm Verifiability:** A built-in "Human-in-the-Loop" modal featuring a custom **client-side PDF.js rendering engine**. It natively renders multi-megabyte PDFs in the browser, instantly scrolling and highlighting the exact page used by the AI to make a compliance decision, without relying on unstable `iframe` data URIs.
- **Exportable Reports:** Instantly export the entire dashboard analysis as a physical or PDF report for stakeholder review.

### 🤖 Dual-Model Hybrid RAG Engine

The AI augmentation in Argus Bid AI is designed with a state-of-the-art dual-model architecture. It operates fully locally on your machine via **Ollama** to ensure strict compliance with public sector data privacy standards. However, when deployed to a cloud platform like Render, it intelligently routes tasks between two models via the **Groq API**:
- **The "Smart" Engine (`llama-3.3-70b-versatile`):** Dedicated exclusively to the highly complex, one-off task of parsing the Master BID JSON ontology.
- **The "Fast" Engine (`llama-3.1-8b-instant`):** Dedicated to high-throughput, repetitive tasks like document classification and vendor evaluation to ensure massive speed while bypassing strict API rate limits.

The platform uses a sophisticated Retrieval-Augmented Generation (RAG) pipeline powered by LangChain and ChromaDB to do three key things:

#### 1. Dynamic Master BID Parsing
Instead of relying on fragile exact-match searches, the engine uses multi-vector semantic search (with `k=20`) to dynamically parse your Master BID. It autonomously identifies every mandatory document, technical specification, and pre-qualification criteria from documents of any length.

#### 2. Smart Fallback for Messy Documents
Vendors often upload documents that are poorly formatted, blurry, or strangely named. The platform uses Llama 3 as a "smart backup" to read the context of the document and correctly label it, ensuring it doesn't fail a vendor just because they named their authorization form "Scan_001.pdf".

#### 3. Generating the Executive Summary Narrative
After the platform has mathematically ranked the vendors, it feeds the results into the Llama 3 model to generate a clean, human-readable "Executive Narrative." It essentially writes the final summary report for you in plain English.

---

## 🚀 What Is Implemented Today
- Full document parsing using `pdfplumber` and `pypdf`.
- Deterministic extraction of Pre-Qualification Criteria and Mandatory Documents using high-speed presence-based fallback engines.
- Explainable AI (XAI) rationale generation for all vendor rankings and disqualifications.
- Beautiful, highly responsive, and dynamic UI built with Streamlit and custom CSS/JS injections.
- Robust, client-side PDF.js rendering bypassing all browser sandbox limitations for secure document inspection.
- Seamless one-click deployment using Render Blueprints.

---

## 🛠️ Tech Stack

| Category | Technology | Details |
| :--- | :--- | :--- |
| **Frontend & UI** | Streamlit | High-performance, pure-Python UI framework. |
| | Custom CSS/JS | Premium glassmorphic styling, animations, and dynamic DOM manipulation. |
| **Backend Logic** | Python 3.11 | Core logic, data processing, and document handling. |
| **AI & NLP** | LangChain, Ollama, Groq, ChromaDB | Intelligent local/cloud hybrid semantic document classification, multi-vector search, and executive summarization using a **Dual-Model Architecture** (`llama-3.3-70b-versatile` for complex ontology extraction, and `llama-3.1-8b-instant` for rapid classification). |
| **Document Processing**| pdfplumber & pypdf | Robust text extraction from complex PDFs. |
| **Deployment** | Render | Native Python Web Service for secure, iframe-free hosting. |

---

## 🏗️ Architecture (High Level)
Argus Bid AI follows a streamlined, single-tier architecture optimized for dynamic deployment and rigorous data processing:
1. **Presentation Layer:** A dynamic Streamlit frontend enhanced with custom HTML/JS/CSS for a premium, responsive user experience.
2. **Processing Layer:** A resilient Python backend that orchestrates file parsing, chunking, and embedding. It natively detects its environment to route NLP tasks either securely to local **Ollama** or rapidly to the **Groq Cloud API**.
3. **Evaluation Layer:** The 100% deterministic rule engine that mathematically applies extracted Master BID constraints to Vendor text arrays, generating a legally defensible XAI scoring matrix.

---

## 📂 Repository Structure

```
Argus-Bid-AI/
├── tender_audit_platform.py    # Main Streamlit application, RAG pipeline, and Core Logic
├── requirements.txt            # Python dependencies (LangChain, ChromaDB, etc.)
├── render.yaml                 # Render Blueprint for 1-click cloud deployment
├── run.bat                     # Windows startup script for local dev
├── ARCHITECTURE.md             # Detailed high-level system architecture
├── CODE_OF_CONDUCT.md          # Open Source contributor code of conduct
├── CONTRIBUTING.md             # Guidelines for contributing to the project
├── LICENSE                     # MIT License
├── SECURITY.md                 # Security policies and reporting instructions
├── .gitignore                  # Ignored files, local caches, and environments
└── README.md                   # Project documentation
```

---

## 💻 Local Setup

The system provides two modes of local execution depending on your hardware and network speed: **Fully Local (Ollama)** or **Cloud Accelerated (Groq)**.

### Prerequisites
- [Python 3.8+](https://www.python.org/)
- [Git](https://git-scm.com/)

### 1. Clone the Repository
```bash
git clone https://github.com/MyselfDebdatta/Argus-Bid-AI-Tender-Audit-Compliance.git
cd Argus-Bid-AI-Tender-Audit-Compliance
```

### 2. Install Dependencies & Run

First, ensure your dependencies are installed (or just use the `run.bat` script on Windows):
```bash
pip install -r requirements.txt
```

**Mode A: 100% Local Privacy (Ollama)**
1. Install [Ollama](https://ollama.com/) on your machine.
2. Open a terminal and download the Llama 3 model: `ollama run llama3`
3. Leave Ollama running in the background.
4. Launch the application: `streamlit run tender_audit_platform.py`
*(The application will detect Ollama and run completely offline).*

**Mode B: Cloud Accelerated (Groq API)**
If you do not want to download the 4.7GB Ollama model, you can test the system locally using Groq's high-speed cloud.
1. Create a free account at [console.groq.com](https://console.groq.com) and generate an API key.
2. Set the hidden environment variable in your terminal:
   ```cmd
   setx GROQ_API_KEY "your-groq-key-here"
   ```
3. Restart your terminal, then run `run.bat` or `streamlit run tender_audit_platform.py`.
*(The application will detect the environment variable and bypass Ollama, routing traffic to Groq).*

---

## 🔒 Security Notes
- **No Hardcoded Keys:** To protect against GitHub repository scraping bots, API keys are **never** hardcoded into the source code. The platform strictly relies on secure Environment Variables (`os.environ.get("GROQ_API_KEY")`).
- **Data Privacy:** When running in Ollama mode, zero data is ever transmitted to the cloud. All document parsing, semantic RAG vectoring, and deterministic auditing is done directly in your machine's RAM.

---

## ☁️ Deployment (Render)
This project is fully configured for a secure, native deployment on **Render**. Because free cloud tiers lack the RAM required to run local LLMs, the platform utilizes its Groq fallback when deployed.

### 1-Click Deploy
1. Create an account at [Render.com](https://render.com).
2. Go to your Dashboard -> **New +** -> **Blueprint**.
3. Connect your GitHub repository. Render will automatically detect the `render.yaml` file.
4. **Crucial Step:** In your Render Web Service settings, navigate to the **Environment Variables** tab.
5. Add a variable named `GROQ_API_KEY` and paste in your free Groq API key.
6. Deploy! The application will run as a native Python Web Service and utilize Groq for high-speed AI tasks.

---

## 🗺️ Roadmap
- [ ] Integration with advanced Document Intelligence for superior scanned-handwriting OCR.
- [ ] Multi-tenant support for different PSU departments.
- [ ] Export to Excel (.xlsx) functionality for the Comparative Matrix.

---

## 📜 License
This project is licensed under the [MIT License](LICENSE). Copyright (c) 2026 Debdatta Panda

## 👨‍💻 Author
**Debdatta Panda**  
LinkedIn: [https://www.linkedin.com/in/debdatta-panda-dp11](https://www.linkedin.com/in/debdatta-panda-dp11)  
GitHub: [@MyselfDebdatta](https://github.com/MyselfDebdatta)
