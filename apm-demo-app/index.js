const apm = require('elastic-apm-node').start({
  serviceName: 'node-apm-demo',
  serverUrl: process.env.ELASTIC_APM_SERVER_URL || 'http://elasticsearch-es-default.logging.svc.cluster.local:8200',
  secretToken: process.env.ELASTIC_APM_SECRET_TOKEN || '',
  environment: 'development'
});

const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('olá, Aquarela!');
});

app.get('/error', (req, res) => {
  throw new Error('erro teste APM');
});

app.listen(port, () => {
  console.log(`app listening at http://localhost:${port}`);
});
