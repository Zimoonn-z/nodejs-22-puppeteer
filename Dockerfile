FROM node:22-slim

RUN apt update && apt install -y \
  chromium \
  libnss3 \
  libatk1.0-0 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libxss1 \
  libxtst6 \
  libpangocairo-1.0-0 \
  libxext6 \
  libxfixes3 \
  libglib2.0-0 \
  libasound2 \
  libgtk-3-0 \
  --no-install-recommends && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /home/container

COPY package*.json ./
RUN npm install

COPY . .

CMD ["node", "index.js"]
