const axios = require('axios');
const cheerio = require('cheerio');

const url = 'https://www.example.com/';

axios.get(url)
    .then(response => {
        const $ = cheerio.load(response.data);
        const pTagText = $('p').text();
        console.log(`Text inside <p> tags: ${pTagText}`);
    })
    .catch(error => console.error('Error:', error));
