const express = require('express');
const app = express();
const routers = require('./api');

app.use(express.json({ limit: '15mb' }));
app.use(express.urlencoded({ extended: true }));

app.use('/api', routers);

const port = process.env.PORT || 9000;
app.listen(port, () => {
  console.log(`Server is listing on http://localhost:${port}`);
});
