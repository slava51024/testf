#базовый образ на основе которого будет работать приложение
FROM node:20

#расположение файлов внутри контейнера
WORKDIR /usr/src/app

#Копирование файлов package-lock.json package.json
COPY package*json ./

#установка зависимостей
RUN npm ci

COPY . .

RUN npm run build

#проброс портов
EXPOSE 3000

CMD ["node", "dist/main"]

