@echo off
echo ==================================================
echo Installing Dependencies...
echo ==================================================
pip install -q -r requirements.txt >nul 2>&1
echo.
echo ==================================================
echo Starting Sentinel Tender Audit Platform...
echo ==================================================
streamlit run tender_audit_platform.py
pause
