<div align="center">

# <img src="logo.jpg" alt="Argus Bid AI Logo" width="40" style="vertical-align: -8px; margin-right: 10px; border-radius: 8px;"> Argus Bid AI — Tender Audit & Compliance

**A production-grade, deterministic AI-driven tender auditing and compliance platform for PSUs.**

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Streamlit](https://img.shields.io/badge/Streamlit-%23FE4B4B.svg?style=for-the-badge&logo=streamlit&logoColor=white)
![Ollama](https://img.shields.io/badge/Ollama-%23000000.svg?style=for-the-badge&logo=ollama&logoColor=white)
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
- **Local RAG Augmentation:** Powered by a locally-hosted Ollama (Llama 3) engine and ChromaDB vector store for highly secure, air-gapped semantic document classification and executive summarization.
- **Dynamic Multi-modal OCR:** Extracts text and tables effortlessly.

### 🧩 Core Product Modules
- **Compliance Engine:** Evaluates PQC, MAFs, and Mandatory Documents based on extracted constraints.
- **Comparative Matrix:** Automatically generates side-by-side technical comparison tables for all responsive bidders.
- **Interactive Dashboard:** A premium, glassmorphic UI for uploading documents, running audits, and viewing explainable results.
- **Exportable Reports:** Instantly export the entire dashboard analysis as a physical or PDF report for stakeholder review.

### 🤖 Local RAG Engine (Ollama & Llama 3)

The AI augmentation in Argus Bid AI is fully local and runs entirely on your machine. This ensures strict compliance with public sector data privacy standards (zero data leaves your system).

The platform uses a sophisticated Retrieval-Augmented Generation (RAG) pipeline powered by ChromaDB to do three key things:

#### 1. Dynamic Master BID Parsing
Instead of relying on fragile exact-match searches, the engine uses multi-vector semantic search (with `k=20`) to dynamically parse your Master BID. It autonomously identifies every mandatory document, technical specification, and pre-qualification criteria from documents of any length.

#### 2. Smart Fallback for Messy Documents
Vendors often upload documents that are poorly formatted, blurry, or strangely named. The platform uses Llama 3 as a "smart backup" to read the context of the document and correctly label it, ensuring it doesn't fail a vendor just because they named their authorization form "Scan_001.pdf".

#### 3. Generating the Executive Summary Narrative
After the platform has mathematically ranked the vendors, it feeds the results into the local Llama 3 model to generate a clean, human-readable "Executive Narrative." It essentially writes the final summary report for you in plain English.

---

## 🚀 What Is Implemented Today
- Full document parsing using `pdfplumber` and `pypdf`.
- Deterministic extraction of Pre-Qualification Criteria and Mandatory Documents.
- Explainable AI (XAI) rationale generation for all vendor rankings and disqualifications.
- Beautiful, highly responsive, and dynamic UI built with Streamlit and custom CSS/JS injections.
- Seamless one-click deployment using Render Blueprints.

---

## 🛠️ Tech Stack

| Category | Technology | Details |
| :--- | :--- | :--- |
| **Frontend & UI** | Streamlit | High-performance, pure-Python UI framework. |
| | Custom CSS/JS | Premium glassmorphic styling, animations, and dynamic DOM manipulation. |
| **Backend Logic** | Python 3.11 | Core logic, data processing, and document handling. |
| **AI & NLP** | Ollama, Llama 3, ChromaDB | 100% local semantic document classification, vector search, and executive summarization. |
| **Document Processing**| pdfplumber & pypdf | Robust text extraction from complex PDFs. |
| **Deployment** | Render | Native Python Web Service for secure, iframe-free hosting. |

---

## 🏗️ Architecture (High Level)
Argus Bid AI follows a streamlined, single-tier architecture optimized for data processing:
1. **Presentation Layer:** A dynamic Streamlit frontend enhanced with custom HTML/JS/CSS for a premium user experience.
2. **Processing Layer:** Python backend that orchestrates file parsing, chunking, embedding, and calls the local Ollama LLM for NLP tasks.
3. **Evaluation Layer:** The deterministic rule engine that applies extracted Master BID constraints to Vendor text arrays, generating the XAI scoring matrix.

---

## 📂 Repository Structure

```
Argus-Bid-AI/
├── tender_audit_platform.py    # Main Streamlit application and core logic
├── requirements.txt            # Python dependencies
├── render.yaml                 # Render Blueprint for 1-click deployment
├── run.bat                     # Windows startup script for local dev
├── .gitignore                  # Ignored files and local caches
└── README.md                   # Project documentation
```

---

## 💻 Local Setup

### Prerequisites
- [Python 3.8+](https://www.python.org/)
- [Git](https://git-scm.com/)
- Local installation of [Ollama](https://ollama.com/) with the 'llama3' model downloaded.

### 1. Clone the Repository
```bash
git clone https://github.com/MyselfDebdatta/Argus-Bid-AI-Tender-Audit-Compliance.git
cd Argus-Bid-AI-Tender-Audit-Compliance
```

### 2. Install Dependencies & Run

**Using the Batch Script (Windows):**
Simply double-click the `run.bat` file. It will silently install dependencies and launch the platform.

**Manual Setup (Mac/Linux/Windows):**
```bash
pip install -r requirements.txt
streamlit run tender_audit_platform.py
```
The application will be accessible at `http://localhost:8501`.

---

## 🔒 Security Notes
- **Data Privacy:** Because the AI runs strictly locally via Ollama, zero data is ever transmitted to the cloud. All document parsing and deterministic auditing is done in-memory on your local machine.

---

## ☁️ Deployment (Render)
This project is fully configured for a secure, native deployment on **Render**.

### 1-Click Deploy
1. Create an account at [Render.com](https://render.com).
2. Go to your Dashboard -> **New +** -> **Blueprint**.
3. Connect your GitHub repository.
4. Render will detect the `render.yaml` file and instantly deploy the application as a native Python Web Service.

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
