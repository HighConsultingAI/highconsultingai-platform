# 🧠 High Consulting AI - Self-Hosted Automation Platform

# Step 1: Use the official n8n base image
FROM n8nio/n8n:latest

# Step 2: Copy your custom UI assets (logo + styles)
COPY ./custom /home/node/.n8n/custom

# Step 3: Set environment variables for High Consulting AI
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"
ENV INSTANCE_NAME="High Consulting AI"
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE="America/Toronto"

# Step 4: Optional - remove any leftover n8n branding dynamically (JS/CSS trick)
RUN echo "/* Hide n8n branding */ \
[data-test-id='logo'], .n8n-branding, .logo { display: none !important; } \
header { background-color: #000 !important; } \
header::after { content: ''; display: block; height: 60px; width: 180px; \
background: url('/home/node/.n8n/custom/logo.png') no-repeat center; \
background-size: contain; margin: 10px auto; }" \
> /home/node/.n8n/custom/styles.css

# Step 5: Expose the default n8n (High Consulting AI) port
EXPOSE 5678

# Step 6: Start the app
CMD ["n8n", "start"]
