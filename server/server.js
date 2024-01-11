const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
const bcrypt = require('bcrypt');

const app = express();
const port = 3001;

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'your-rds-endpoint',      // Replace with your RDS endpoint
  user: 'your-db-username',       // Replace with your database username
  password: 'your-db-password',   // Replace with your database password
  database: 'your-db-name',       // Replace with your database name
});

db.connect((err) => {
  if (err) {
    console.error('Database connection failed: ', err);
  } else {
    console.log('Connected to the database');
  }
});

app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;

  const query = 'SELECT * FROM users WHERE email = ?';
  db.query(query, [email], async (err, results) => {
    if (err) {
      console.error('Error executing query: ', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      if (results.length > 0) {
        const user = results[0];

        try {
          const match = await bcrypt.compare(password, user.password);

          if (match) {
            res.json({ success: true, message: 'Login successful' });
          } else {
            res.status(401).json({ error: 'Invalid credentials' });
          }
        } catch (bcryptErr) {
          console.error('Error comparing passwords: ', bcryptErr);
          res.status(500).json({ error: 'Internal Server Error' });
        }
      } else {
        res.status(401).json({ error: 'User not found' });
      }
    }
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
