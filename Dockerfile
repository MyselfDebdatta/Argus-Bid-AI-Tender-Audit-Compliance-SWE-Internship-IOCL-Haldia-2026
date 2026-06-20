FROM python:3.11-slim

WORKDIR /code

# Install requirements as root first
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Hugging Face Spaces requires apps to run as a non-root user (id 1000) for security.
# Without this, the proxy will silently block the iframe from loading!
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app

# Copy all files with proper permissions
COPY --chown=user . $HOME/app

EXPOSE 7860

CMD ["streamlit", "run", "tender_audit_platform.py", "--server.port", "7860", "--server.address", "0.0.0.0", "--server.enableCORS", "false", "--server.enableXsrfProtection", "false"]
