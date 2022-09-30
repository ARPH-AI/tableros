FROM node:16.17
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 5000
ENTRYPOINT ["npm", "run","watch"]
