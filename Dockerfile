FROM node:alpine as builder 
#builder phase

WORKDIR "/app"

COPY package.json .
RUN npm i

COPY . .

RUN npm run build

#app/build --->folder of build

FROM nginx
COPY --from=builder /app/build /usr/share/ninx/html
#nginx start automatically