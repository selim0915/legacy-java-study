var url = require('url');

var urlStr ='https://www.youtube.com/watch?v=RtOSw8TLCtQ&list=PLG7te9eYUi7tHH-hJ2yzBJ9h6dwBu1FUy&index=15';

var curUrl = url.parse(urlStr); /*url객체로 만들기*/

console.dir(curUrl);

console.log('query -> ' + curUrl.query);

var curStr = url.format(curUrl);
/*문자열 변환*/

console.log('url -> '+curStr);

var querystrinhg = require('querystring');

var params = querystrinhg.parse(curUrl.query);

console.log('검색어: '+params.query);
