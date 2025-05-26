API_ENDPOINT=http://localhost:3001
REACT_APP_API_URL=$API_ENDPOINT SKIP_PREFLIGHT_CHECK=true npm run build --prefix client
echo '>> Fazendo deploy dos assets'
aws s3 sync client/build s3://b1a-cdn/ --exclude "index.html"

echo '>> Fazendo deploy do index.html'
aws s3 sync client/build s3://b1a-cdn/ --exclude "*" --include "index.html"