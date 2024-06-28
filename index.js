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

async function checkVisisted() {
  const result = await db.query("SELECT country_code FROM visited_countries");

  let countries = result.rows.map(row => row.country_code); 
  return countries;
}

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", async (req, res) => {
  const result = await checkVisisted(); 
  res.render("index.ejs", { countries: result, total: result.length });
});

app.post("/add", async (req, res) => {
  let country = req.body.country;
  const results = await db.query("SELECT country_code  FROM countries Where country_name = $1", [country]);
  console.log(results);

  if (results.rows.length !== 0) {
    const data = results.rows[0];
    const countryCode = data.country_code;

    await db.query(`INSERT INTO visited_countries (country_code) VALUES ('${countryCode}')`);
    res.redirect("/");
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

