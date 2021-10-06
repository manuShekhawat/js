// const req = new XMLHttpRequest(); // old school way of sendng request

// req.onload = function(){
//   console.log("all done with request");
//   const s = JSON.parse(this.responseText);
//   console.log(s.ticker.price);
// }

// req.onerror = function(){
//   console.log("error");
// }

// req.open('GET','https://api.cryptonator.com/api/ticker/btc-usd');
// req.send();

// XMLHttpreq object is this 

// ================================FETCH===============================================

//@ Fetch returns a promise

// fetch('https://api.cryptonator.com/api/ticker/btc-usd')
//    .then(res=>{
//      console.log("response waiting to parse...", res);
//      return res.json(); // res.json() return a promise as fetch may not load complete data all at once
//    })
//    .then(data =>{
//      console.log("Data parsed");
//      console.log(data.ticker.price);
//    })
//    .catch(e=>{
//      console.log('eror');
//    })



// const fetchBitCoinPrice = async() =>{
//   try{
//   const res = await fetch('https://api.cryptonator.com/api/ticker/btc-usd');
//   const data = await res.json();
//   console.log(data.ticker.price);
//   }
//   catch(e){
//     console.log("something went wrong");
//   }
// }

// fetchBitCoinPrice();


// class X{
//     constructor(x,y,z){
//         this.x = x;
//         this.y = y;
//         this.z = z;
//     }

//     get(){
//         console.log(this.x,this.y,this.z);
//     }
// }

// const p = new X(1,2,3);

// p.get();
// console.log(p);
// console.log(Object.getPrototypeOf(p));
// console.log(p.__proto__);


const readline = require('readline');


const rl = readline.createInterface({
    input: process.stdin,
    output : process.stdout
});

let num = [];

rl.question('',(answer)=>{
    console.log(answer);
    num = answer;
    console.log(num);
    rl.close();
});

let t = 1;
rl.question('',(answer)=>{
    t = answer;
    console.log(t);
    rl.close();
});


