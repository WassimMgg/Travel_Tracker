import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "World",
  password: "29052003",
  port: 5433,
});

db.connect((err) => {
  if (err) {
    console.error("connection error", err.stack);
  } else {
    console.log("connected");
  }
});

let result = []; 

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", async (req, res) => {
  db.query("SELECT country_code FROM visited_countries", (err, res) => {
    if (err) {
      console.error("error", err);
    } else {
      result = res.rows.map(row => row.country_code);
    }
  });
  let total_countries = result.length;
  console.log(result); 
  res.render("index.ejs", { countries: result, total : total_countries });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

