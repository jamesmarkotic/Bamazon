const mysql = require('mysql');
const inquirer = require('inquirer');

const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "",
  database: "Bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  buyAuction();
});

function buyAuction() {
  // query the database for all items being auctioned
  connection.query("SELECT * FROM products", function(err, results) {
    if (err) throw err;
    // once you have the items, prompt the user for which they'd like to buy on
    inquirer
      .prompt([
        {
          name: "choice",
          type: "list",
          choices: function() {
            var choiceArray = [];
            for (var i = 0; i < results.length; i++) {
              choiceArray.push(results[i].product_name);
            }
            return choiceArray;
          },
          message: "What item would you like to buy?"
        },
        {
          name: "buy",
          type: "input",
          message: "How much would you like to buy?"
        }
      ])
      .then(function(answer) {
        // get the information of the chosen item
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].product_name === answer.choice) {
            chosenItem = results[i];
          }
        }
        var newStock = chosenItem.stock_quantity - answer.buy;

        // determine if buy was high enough
        if (chosenItem.stock_quantity >= parseInt(answer.buy)) {
          // buy was high enough, so update db, let the user know, and start over
          connection.query(
            "UPDATE products SET ? WHERE ?",
            [
              {
                stock_quantity: newStock
              },
              {
                item_id: chosenItem.item_id
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Item bought successfully!");
              buyAuction();
            }
          );
        }
        else {
          // buy wasn't high enough, so apologize and start over
          console.log("Your item is out of stock. Try again...");
          buyAuction();
        }
      });
  });
}
