# rabbitmq-stomp-web

A test environment to play with RabbitMQ and STOMP via web socket. The web code is partially from [here](https://github.com/rabbitmq/rabbitmq-web-stomp-examples) and it is hosted in a nginx container.

## Test environment

Be sure to have Docker and Docker-Compose installed. Ensure you can execute the scripts in the project:

```bash
chmod +x cluster/start.sh
chmod +x cluster/stop.sh
chmod +x rabbitmq/cluster-entrypoint.sh
```

If you are on Mac or Linux, navigate the folder "cluster" and run the script ./start.sh. The script will run (and build) an environment containing RabbitMQ (three nodes with Web Management, MQTT, STOMP plugins), nginx and haproxy (load balancer for 2 nginx nodes and 3 rabbitmq nodes).

To access to the web example, once the environment is up, navigate http://localhost.

To stop the environment just run ./stop.sh

If you want to make some changes to the web application, just go into the nginx/app folder, edit index.html and refresh the browser.

For additional details, check the docker-compose file in the folder "cluster".

## Testing the Web App

The test application just subscribes to a topic (topic/test) and waits for messages that can be sent trough the same page or even directly from RabbitMQ Web Console. 

Main code:

```javscript
// Stomp.js boilerplate
var client = Stomp.client('ws://' + window.location.hostname + ':15674/ws');
client.debug = pipe('#second');
var print_first = pipe('#first', function (data) {
    client.send('/topic/test', {
        "content-type": "text/plain"
    }, data);
});
var on_connect = function (x) {
    id = client.subscribe("/topic/test", function (d) {
        print_first(d.body);
    });
};
var on_error = function () {
    console.log('error');
};
client.connect('rabbit', 'Rabbit123!', on_connect, on_error, '/');
```

## RabbitMQ

To access to RabbitMQ, open the browser and navigate to http://localhost:15672, default creadentials are:

- username: rabbit
- password: Rabbit123!

You can try to send a message to the web application from RabbitMQ Web console. Just select the queue generated by the web application and send a payload, you should see the result in the test page.
