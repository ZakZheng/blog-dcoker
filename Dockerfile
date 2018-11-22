FROM node

LABEL maintainer="Zak Zheng <1258645603@qq.com>"

# ENV NODE_ENV=production
ENV HOST 0.0.0.0

RUN mkdir -p /app
COPY . /app
WORKDIR /app

#If the environment in China build please open the following comments
#如果在中国环境下构建请把下面注释打开
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install yarn -g && \
    yarn config set registry https://registry.npm.taobao.org && \
    yarn && \
    yarn build

CMD ["yarn", "start"]