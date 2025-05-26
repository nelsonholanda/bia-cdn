API_ENDPOINT=http://d6dh6hbhk150r.cloudfront.net
REACT_APP_API_URL=$API_ENDPOINT SKIP_PREFLIGHT_CHECK=true npm run build --prefix client
echo '>> Deploy assets S3'
aws s3 sync client/build s3://b1a-cdn --exclude "index.html"
echo '>> Deploy index.html'
aws s3 sync client/build s3://b1a-cdn --exclude "*" --include "index.html"