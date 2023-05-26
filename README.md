# pamstack
It's like JAMStack, but backed by PHP. 

## How to use

1. Throw your static assets and front-end JS into `source/`. Your main webpage should be `source/index.html`
2. Throw a function into a file inside `functions/`. As an example:

```php
<?php
# functions/hello-world.php
return function() {
    return [
        'status' => 200,
        'body' => json_encode(['message' => "Hello World"])
    ];
};
```

3. Scripts will be mapped to `/.pamstack/functions/[file-name]`, so the above becomes `/.pamstack/functions/hello-world`

```js
const data = await fetch('/.pamstack/functions/hello-world').then(response => response.json());
```

4. Run `make deploy` and visit `http://localhost:8080`

## Functions
Each function script should return a function or invokable object that returns JSON. The structure of the JSON
should return a `status` key with the HTTP status code to return, and a `body` key with the JSON body that will
be returned. 

The routing script will translate that into the proper HTTP status code return and JSON body for your front-end
to consume.

## Static Site Generation
PAMStack includes [Sculpin](https://github.com/sculpin/sculpin) as a static site generator. You can put your Sculpin source files into the `source/` directory and Sculpin will build the static portion of your site in the background automatically. Functions included in the `functions/` folder will continue to be invoked dynamically.