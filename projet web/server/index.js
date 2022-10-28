const express = require('express')
const app = express()
const port = 8080

console.log("server_index");

app.get('/', (req, res) =>{
    res.send('Hello World')
})

app.listen(port, () => console.log(`Connected on port ${port}.`))