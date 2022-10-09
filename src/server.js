const app = require('./app');
const connection = require('./db/connection');
require('dotenv').config();

app.listen(process.env.PORT, async () => {
  console.log(`API Boteco do Seu Zé está sendo executada na porta ${process.env.PORT}`);

  // O código abaixo é para testarmos a comunicação com o MySQL
  const [result] = await connection.execute('SELECT 1');
  if (result) {
    console.log('MySQL connection OK');
  }
});