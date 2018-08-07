var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 8889,
  user: "root",
  password: "root",
  database: "bamazon"
});

var userInputID = 0;
var userInputQuantity = 0;

connection.connect(function(err) {
  if (err) throw err;
  displayItems();
});

function displayItems() {
    var query = "SELECT * FROM products";
    connection.query(query, function(err, res) {
      for (var i = 0; i < res.length; i++) {
          console.log("ID: " + res[i].item_id + " || Name: " + res[i].product_name + " || Price: " + res[i].price);
      }
      chooseItem();
    });
}

function chooseItem() {
  inquirer
    .prompt([{
      name: "id",
      type: "input",
      message: "What is the ID of the item you'd like to purchase?"
    },{
        name: "quantity",
        type: "input",
        message: "How many would you like to buy?"
      }
    ])
    .then(function(answer) {
            connection.query("SELECT stock_quantity, price FROM products WHERE item_id = " + mysql.escape(answer.id), function(err, res) {
                if (err) throw err; 
                userInputID = parseInt(answer.id);
                userInputQuantity = parseInt(answer.quantity);
                checkStock(parseInt(res[0].stock_quantity), parseFloat(res[0].price));
            });
    });
}

function checkStock(itemQuantity, itemPrice){
    if(userInputQuantity <= itemQuantity){
        var updatedQuantity = itemQuantity - userInputQuantity;
        updateQuantity(updatedQuantity, itemPrice);
    } else{
        console.log("Sorry, there's an insufficient quantity!");
    }
}

function updateQuantity(newStockValue, price){
    connection.query("UPDATE products SET stock_quantity =" + mysql.escape(newStockValue) + " WHERE item_id = " + mysql.escape(userInputID), function(err, res) {
        if (err) throw err;
        console.log("Your total is: " + (userInputQuantity * price) + ".");
    });
}