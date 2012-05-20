/*
 * Copyright 2011 Google Inc. All Rights Reserved.

 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

var clippit = new OAuth2('clippit', {
  client_id: '8j5CKzUVIMtTfCbrTIIVpHPKzQ0eOj9CBwiILf9W',
  client_secret: 'K3NmBNFModqp1NCRa8TMCzmNTJ1A3EvQe2pS2oph',
  api_scope: 'http://clippitapp.com:3000/api/v1/'
});

clippit.authorize(function() {

//document.addEventListener('DOMContentLoaded', function() {

  // Make an XHR that creates the task
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function(event) {
    if (xhr.readyState == 4) {
      if(xhr.status == 200) {
        // Great success: parse response with JSON
        var parsed = JSON.parse(xhr.responseText);
        // var html = '';
        // parsed.data.forEach(function(item, index) {
        //   html += '<li>' + item.name + '</li>';
        // });
				alert("boom")
        document.querySelector('#music').innerHTML = "good";
        return;

      } else {
				alert("no boom")
				document.querySelector('#music').innerHTML = "bad";
        console.log("something bad happened")
      }
    }
  };
  xhr.open('GET', 'http://clippitapp.com:3000/api/v1/users/ninjabiscuit', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.setRequestHeader('Authorization', 'OAuth ' + clippit.getAccessToken());
  xhr.send();

});