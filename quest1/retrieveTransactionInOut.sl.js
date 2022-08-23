var http = require("http");
var axios = require("axios");


async function retrieveTxValue(txHash) {
    let inx = [];
    let out = [];

    const response = await axios.get(`https://api.blockcypher.com/v1/btc/test3/txs/${txHash}`)
        .then(function (response) {
            for (var i = 0; i < response.data.inputs.length; i++) {
                if (response.data.inputs[i].output_value == undefined) {
                    inx.push(0);
                } else {
                    inx.push(response.data.inputs[i].output_value / (10 ** 8))
                }
            }
            for (var i = 0; i < response.data.outputs.length; i++) {
                out.push(response.data.outputs[i].value / (10 ** 8))
            }
            return {
                in: inx,
                out: out
            }
        }).catch(function (error) {
            console.log(error);
        });
    console.log(response);
    return response;
}
const txHash = 'd030023d96b9170af9ec2fe5d9b62a5eacbcbf144c68f3f45d68bca72d1d3649'
retrieveTxValue(txHash);
// console.log(res);

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