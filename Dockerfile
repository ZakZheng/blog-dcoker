FROM node:6.10.3-slim

LABEL maintainer="Zak Zheng <1258645603@qq.com>"

ENV NODE_ENV=production

ENV HOST 0.0.0.0

RUN mkdir -p /app
COPY . /app
WORKDIR /app

#If the environment in China build please open the following comments
#如果在中国环境下构建请把下面注释打开
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install && \
    npm build

CMD ["npm", "start"]

# Expose the app port
EXPOSE 3000
