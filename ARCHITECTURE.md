# 🏛️ Argus Bid AI Architecture

Welcome to the architectural overview of **Argus Bid AI**. This document is designed for developers, maintainers, and security auditors who want to understand the deep technical structure of the platform. 🛠️

---

## 🌟 High-Level Design

Argus Bid AI is designed as a **Single-Tier Streamlit Application** that seamlessly blends a highly responsive frontend with a robust, hybrid-RAG backend. The core philosophy of the architecture is **Deterministic Verifiability**. 

While Large Language Models (LLMs) are used for semantic classification and parsing, the actual compliance evaluation (Pass/Fail) is executed by a strict, mathematical rule-engine. This guarantees that the system never hallucinates a compliance decision. 🧠+🤖

---

## 🏗️ Core Components

### 1. 🖥️ The Presentation Layer (Streamlit + UI Injections)
* **Framework:** Streamlit is used for rapid Python-based UI generation.
* **Custom Styling:** The platform injects raw CSS and HTML to override Streamlit's default components, resulting in a premium **Glassmorphic** and **Cyberpunk-inspired** dark mode aesthetic.
* **Component Highlights:**
  * **Interactive Drawers:** Uses `st.expander` tailored with custom borders and hover states.
  * **Client-Side PDF Rendering:** Bypasses browser iframe security restrictions by injecting a full **PDF.js** engine directly into the DOM via `components.html()`. This allows users to inspect multi-megabyte PDFs instantly without server lag. 📄✨

### 2. 🧠 The Intelligent NLP Layer (Hybrid RAG)
The system leverages a **Dual-Model Architecture** to balance complexity, speed, and cost.
* **Local Mode (Ollama):** For air-gapped, high-privacy environments, the system runs entirely offline using local Llama 3 models.
* **Cloud Mode (Groq API):** When deployed to Render, it intelligently routes to Groq's high-speed inference endpoints.
* **Multi-Vector Semantic Search:** Uses **ChromaDB** to vectorize the vendor's PDF text. When extracting data, it pulls multiple surrounding text chunks (k=20) to ensure high contextual accuracy. 🔍

### 3. ⚙️ The Deterministic Evaluation Engine (The "Audit Gate")
This is the heart of the platform. Instead of asking the AI, "Does this vendor pass?", the system asks the AI to *extract the data*, and then Python code makes the decision.
* **PQC Overlap Engine:** For Pre-Qualification Criteria, it uses a massive 250-character window and checks if *any* significant keywords from the requirement label co-exist with the required threshold number. 📏
* **Mandatory Documents Scanner:** Employs a fast token-overlap check against the vendor's inventory and raw text. If 50% of a document's keywords are present, it passes. No AI hallucinations! 🚫🤖

---

## 🔄 Data Flow (The Audit Lifecycle)

1. **📥 Ingestion:** The Master BID (JSON) and Vendor submissions (PDFs) are uploaded.
2. **📖 Extraction & OCR:** `pdfplumber` and `pypdf` extract text and structure from the PDFs.
3. **🗂️ Classification:** The AI (or regex fallback) classifies each vendor document (e.g., "MAF", "Turnover Certificate").
4. **🧩 Ontology Mapping:** The Master BID constraints are parsed and stored in session state.
5. **⚖️ Evaluation:** The Deterministic Engine cross-matches the vendor's text against the constraints.
6. **📊 Presentation:** The results are rendered in the Comparative Matrix and Compliance Leaderboard, complete with XAI (Explainable AI) justifications.

---

## ☁️ Deployment Architecture (Render)

When deployed on **Render**, the application acts as a standard Python Web Service.
* **Statelessness:** The app does not rely on a persistent external database. All session data is stored in Streamlit's `st.session_state` and local cache files during the user's active session.
* **Cold Starts:** Render's free tier spins down the app after inactivity. The architecture is lightweight enough to spin back up quickly, fetching models dynamically.

---

## 🔮 Future Architecture Goals
* **Microservices Split:** Separating the Streamlit frontend from a FastAPI backend for easier scaling.
* **Persistent Storage:** Integrating PostgreSQL/MongoDB for storing historical audit logs.
* **Advanced Vision:** Swapping `pdfplumber` for a dedicated Vision-Language Model (VLM) to handle messy handwritten documents.

Thank you for exploring the architecture of Argus Bid AI! 🚀
