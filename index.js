import express from "express";
import bodyParser from "body-parser";
import pg from "pg";


const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "World",
  password: "29052003",
  port: "5433",
});

db.connect((err) => {
  if (err) {
    console.error("connection error", err.stack);
  } else {
    console.log("connected");
  }
});

async function isVisited(code) {
  const results = await checkVisited();
  for (let i = 0; i < results.length; i++) {
    if (results[i] === code) {
      return true;
    }
  }
  return false;
}

async function checkVisited() {
  const result = await db.query("SELECT country_code FROM visited_countries");
  let countries = result.rows.map(row => row.country_code);
  return countries;
}

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get("/", async (req, res) => {
  const result = await checkVisited();
  console.log(result);
  res.render("index.ejs", { countries: result, total: result.length });
});

app.post("/add", async (req, res) => {
  let country = req.body.country;
  const results = await db.query("SELECT country_code FROM countries WHERE LOWER(country_name) LIKE $1", [ '%'+ country.toLowerCase() + '%']);
  if (!results.rows.length) {
    const result = await checkVisited();
    res.render("index.ejs", { error: "Country doesn't exist, try again", countries: result, total: result.length });
    return;
  }

  const data = results.rows[0];
  const countryCode = data.country_code;
  let visited = await isVisited(countryCode);
  if (!visited) {
    await db.query(`INSERT INTO visited_countries (country_code) VALUES ('${countryCode}')`);
    res.redirect("/");
  } else {
    const result = await checkVisited();
    res.render("index.ejs", { error: "Country already visited", countries: result, total: result.length });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});