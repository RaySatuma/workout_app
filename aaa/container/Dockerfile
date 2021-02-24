FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除（多分かぶるの防いでる）
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/nginx.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf