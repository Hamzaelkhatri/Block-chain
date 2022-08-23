var axios = require("axios");


async function retrieveBlockDate(height) {
    const response = await axios.get(`https://api.blockcypher.com/v1/btc/test3/blocks/${height}`)
        .then(function (response) {
            return response.data.time;
        }).catch(function (error) {
            console.log(error);
        });
    return new Date(response);
}  

// retrieveBlockDate(1881467);

// http.createServer(function (request, response) {
//     // Send the HTTP header 
//     // HTTP Status: 200 : OK
//     // Content Type: text/plain
//     response.writeHead(200, { 'Content-Type': 'text/plain' });

//     // Send the response body as "Hello World"
//     response.end('Hello World\n');
// }).listen(8081);

// // Console will print the message
// console.log('Server running at http://127.0.0.1:8081/');