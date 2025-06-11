# frontend/Dockerfile
FROM node:18-bullseye

WORKDIR /app

RUN npm create vite@latest . -- --template react

RUN npm install

COPY . .

EXPOSE 5173

ENV CHOKIDAR_USEPOLLING=true

CMD ["npm", "run", "dev", "--", "--host"]
