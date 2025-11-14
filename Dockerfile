FROM python:3.11-slim

# Lite basic verktyg
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installera uv + docling-mcp
RUN pip install --no-cache-dir uv docling-mcp

# MCP-servern kommer lyssna på denna port
EXPOSE 8001

# Starta docling-mcp-server med HTTP-transport
CMD ["sh", "-c", "uvx --python 3.11 --from docling-mcp docling-mcp-server --transport streamable-http --host 0.0.0.0 --port $PORT"]
