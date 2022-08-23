var http = require("http");
var axios = require("axios");


async function retrieveTxValue(txHash) {
    const response = await axios.get(`https://api.blockcypher.com/v1/btc/test3/txs/${txHash}`)
        .then(function (response) {
            // console.log(response.data);
            return response.data;
        }).catch(function (error) {
            console.log(error);
        });
    return response.inputs[0].output_value / (10 ** 8);
}
// txHash = 'd030023d96b9170af9ec2fe5d9b62a5eacbcbf144c68f3f45d68bca72d1d3649'

// retrieveTxValue(txHash);

http.createServer(function (request, response) {
    // Send the HTTP header 
    // HTTP Status: 200 : OK
    // Content Type: text/plain
    response.writeHead(200, { 'Content-Type': 'text/plain' });

    // Send the response body as "Hello World"
    response.end('Hello World\n');
}).listen(8081);

// Console will print the message
console.log('Server running at http://127.0.0.1:8081/');