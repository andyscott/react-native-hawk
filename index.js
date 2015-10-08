'use strict';

const RNHawk  = require('NativeModules').RNHawk;

export default RNHawk;

// can be called as follows:
/*
import Hawk from 'react-native-hawk';
Hawk.generateRequestHeader({
  credentials: {
    id: 'exqbZWtykFZIh2D7cXi9dA',
    key: 'HX9QcbD-r3ItFEnRcAuOSg',
    algorithm: 'sha256'
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
*/
