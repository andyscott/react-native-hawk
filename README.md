# react-native-hawk
Hawk support for react native.

This is a wrapper around https://github.com/tent/hawk-objc.


### Example (using data from hawk-objc tests):
```
import Hawk from 'react-native-hawk';
Hawk.generateRequestHeader({
  credentials: {
    id          : 'exqbZWtykFZIh2D7cXi9dA',
    key         : 'HX9QcbD-r3ItFEnRcAuOSg',
    algorithm   : 'sha256'
  },
  contentType   : 'application/vnd.tent.post.v0+json',
  method        : 'POST',
  requestUri    : '/posts',
  host          : 'example.com',
  port          : 443,
  payload       : '{\"type\":\"https://tent.io/types/status/v0#\"}'
}, (header) => {
  console.log('got header: ' + header);
});
```

This prints `got header: Authorization: Hawk id="exqbZWtykFZIh2D7cXi9dA", mac="aBRih06F36eDFfyq06yNcItZZWFLsPKZOXQPnHm9I+c=", ts="0", nonce="D9AA709B-322D-4E44-AC01-F070317638C7", hash="neQFHgYKl/jFqDINrC21uLS0gkFglTz789rzcSr7HYU="`.

## Getting started
1. `npm install --save react-native-hawk`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. add `./node_modules/react-native-hawk/RNHawk.xcodeproj`
4. In the XCode project navigator, select your project, select the `Build Phases` tab and in the `Link Binary With Libraries` section add **libRNHawk.a**
6. `import Hawk from 'react-native-hawk';` in your code.
