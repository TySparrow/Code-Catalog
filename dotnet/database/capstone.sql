USE master
GO
--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END
CREATE DATABASE final_capstone
GO
USE final_capstone
GO
--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)
CREATE TABLE examples (
	example_id int IDENTITY(1001,1) PRIMARY KEY NOT NULL,
	user_id int null,
	example_title varchar(100) UNIQUE NOT NULL,
	example_tag varchar(100) NOT NULL,
	example_language varchar(50) NOT NULL,
	example_code varchar(1000) NOT NULL,
	example_source varchar(100) NOT NULL,
	example_status varchar (30) NOT NULL
	CONSTRAINT FK_examples_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');


USE [final_capstone]
GO
SET IDENTITY_INSERT [dbo].[examples] ON 
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1001, NULL, N'string concatination', N'strings', N'C#', N'"Welcome to " + "C# snippet"', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1002, NULL, N'let', N'variables', N'JavaScript', N'let example = "example"', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1003, NULL, N'Colors', N'styling', N'CSS', N'/* Changing text color */
.label {
  color: blue;
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1004, NULL, N'Background Color', N'styling', N'CSS', N'/* Setting background color */
.label {
  background-color: yellow;
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1005, NULL, N'Divs', N'formatting', N'HTML', N'<!-- Div -->
<div>
  <!-- Content goes here -->
</div>
<!-- A generic container used for grouping elements -->', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1006, NULL, N'Initilizing An Array', N'Arrays', N'C#', N'int newArray[] = new int[10]', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1007, NULL, N'Indexing Arrays', N'Arrays', N'C#', N'int[] testScores = new int[10];

// ... populate the array

int lastValue = testScores[testScores.Length - 1];
int secondToLastValue = testScores[testScores.Length - 2];', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1008, NULL, N'Get Array Size', N'Arrays', N'C#', N'int size = someArray.Length;', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1009, NULL, N'Intro to Substrings', N'Strings', N'C#', N'//The Substring() method gets a small subset of an existing string. 
//The parameters are:

// 1)The index to start the substring.
// 2)An optional length of the string to retrieve. If not given, goes to the end of the string.

string fullName = "Tech Elevator";
string firstName = fullName.Substring(0, 4); // <- Will equal "Tech"
string lastName = fullName.Substring(5); // <- Will equal "Elevator"', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1010, NULL, N'if-else', N'Logical Branching', N'C#', N'namespace LogicalBranchingExamples
{
        /*
         * Grade-o-matic v1.0 scores tests as pass-fail.
         * A score of 70 or higher is a passing score. 
         * Return true for a passing score and false for a failing score.
         * 
         * GradeTestPassFail(90) ? true
         * GradeTestPassFail(70) ? true
         * GradeTestPassFail(45) ? false
         */

    public class TestGrading
    {
        
        public bool GradeTestPassFail(int score)
        {
           if (score >= 70)
            {
                return true;
            }
           else
            {
                return false;
            }
        }', N'TE-Exercises', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1011, NULL, N'for-loop', N'loops', N'C#', N'string[] myArray = { "apple", "banana", "orange" };
for (int i = 0; i < myArray.Length; i++)
{
    Console.WriteLine(myArray[i]);
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1012, 2, N'Border Styling', N'styling', N'CSS', N'/* Border styling */
.label {
  border: 1px solid black;
  padding: 4px;
  border-radius: 5px;
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1013, 2, N'Gradient Background', N'styling', N'CSS', N'/* Gradient background */
.gradient-bg {
  background: linear-gradient(45deg, #FFD700, #FF6347);
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1014, 2, N'Text Alignment', N'styling', N'CSS', N'/* Text center alignment */
.center-text {
  text-align: center;
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1015, 2, N'Button Styling', N'styling', N'CSS', N'/* Button style */
.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #ffffff;
  text-align: center;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.button:hover {
  background-color: #45a049;
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1016, 2, N'Responsive Design', N'styling', N'CSS', N'/* Responsive design */
@media (max-width: 768px) {
  .responsive {
    width: 100%;
    padding: 10px;
  }
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1017, 2, N'Header Styling', N'styling', N'CSS', N'/* Header styling */
.header {
  font-size: 24px;
  font-weight: bold;
  color: #333333;
  text-align: center;
}', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1018, 2, N'Inline Elements', N'styling', N'CSS', N'/* Displaying elements inline */
.inline-elements span {
  display: inline;
  margin-right: 10px;
}

/* Inline list items */
.inline-list li {
  display: inline;
  margin-right: 10px;
}', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1019, 2, N'Block Elements', N'styling', N'CSS', N'/* Displaying elements as blocks */
.block-element {
  display: block;
  width: 200px;
  height: 100px;
  background-color: #f5f5f5;
  margin-bottom: 10px;
}', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1020, 2, N'for-each loop', N'loops', N'C#', N'using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Create a list of animals
        List<string> ListOfAnimals = new List<string>
        {
            "Dog",
            "Cat",
            "Elephant",
            "Lion",
            "Tiger"
        };

        // Iterate through the list using foreach loop
        foreach (string animal in ListOfAnimals)
        {
            Console.WriteLine(animal);
        }
    }
}', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1021, 2, N'do while loop', N'loops', N'C#', N'using System;

class Program
{
    static void Main()
    {
        int pushupCount = 0;

        do
        {
            pushupCount++;
            Console.WriteLine($"Number of pushups: {pushupCount}");
        } while (pushupCount < 10);
        
        Console.WriteLine("You reached 10 pushups!");
    }
}', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1022, 2, N'Switch Statement', N'Switch', N'C#', N'int day = 4;
switch (day) 
{
  case 1:
    Console.WriteLine("Monday");
    break;
  case 2:
    Console.WriteLine("Tuesday");
    break;
  case 3:
    Console.WriteLine("Wednesday");
    break;
  case 4:
    Console.WriteLine("Thursday");
    break;
  case 5:
    Console.WriteLine("Friday");
    break;
  case 6:
    Console.WriteLine("Saturday");
    break;
  case 7:
    Console.WriteLine("Sunday");
    break;
}
// Outputs "Thursday" (day 4)', N'W3 Schools', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1023, 2, N'HTML Basics', N'basics', N'HTML', N'<!DOCTYPE html>
<html>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body>
</html>', N'W3 Schools', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1024, 2, N'Anchor Tag', N'tags', N'HTML', N'<!-- Anchor -->

<a href="https://example.com">Link</a>

<!-- Creates a hyperlink to another web page or resource -->', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1025, 2, N'HTML Image', N'tags', N'HTML', N'<!-- Image -->

<img src="image.jpg" alt="Image Description" />

<!-- Embeds an image in the document -->', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1026, 2, N'Unordered List', N'tags', N'HTML', N'<!-- Unordered List -->

<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>

<!-- Creates an unordered list -->', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1027, 2, N'Ordered List', N'tags', N'HTML', N'<!-- Ordered List -->

<ol>
  <li>First item</li>
  <li>Second item</li>
</ol>

<!-- Creates an ordered (numbered) list -->', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1028, 2, N'Input Field', N'tags', N'HTML', N'<!-- Input -->

<input type="text" placeholder="Enter your name" />

<!-- Creates an input field -->', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1029, 2, N'Button', N'tags', N'HTML', N'<!-- Button -->

<button>Click Me</button>

<!-- Creates a clickable button -->', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1030, 2, N'Table', N'tags', N'HTML', N'<table>
  <thead>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
      <th>Header 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Row 1, Cell 1</td>
      <td>Row 1, Cell 2</td>
      <td>Row 1, Cell 3</td>
    </tr>
    <tr>
      <td>Row 2, Cell 1</td>
      <td>Row 2, Cell 2</td>
      <td>Row 2, Cell 3</td>
    </tr>
    <tr>
      <td>Row 3, Cell 1</td>
      <td>Row 3, Cell 2</td>
      <td>Row 3, Cell 3</td>
    </tr>
  </tbody>
</table>', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1031, 2, N'Headings', N'tags', N'HTML', N'<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1032, 2, N'INSERT INTO', N'tables', N'SQL', N'INSERT INTO person (person_name, birthday)
OUTPUT Inserted.person_id
VALUES (''Tyler Sparrow'', ''1994-03-14'')', N'Exercises', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1033, 2, N'UPDATE', N'tables', N'SQL', N'UPDATE movie 
SET title = ''Star Wars: A New Hope'' WHERE movie.title = ''Star Wars''', N'Exercises', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1034, 2, N'Nested SELECT in UPDATE', N'tables', N'SQL', N'UPDATE movie
SET overview = ''This is a long movie. '' + (SELECT CAST(length_minutes AS varchar)) + '' minutes long.''
WHERE length_minutes > 210
', N'Exercises', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1035, 2, N'SELECT *', N'tables', N'SQL', N'SELECT * FROM users;', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1036, 2, N'WHERE Clause', N'tables', N'SQL', N'SELECT * FROM products WHERE price > 50;', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1037, 2, N'ORDER BY', N'tables', N'SQL', N'SELECT * FROM employees ORDER BY salary DESC;', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1038, 2, N'JOIN', N'tables', N'SQL', N'SELECT orders.order_id, customers.customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1039, 2, N'Multiple Joins', N'tables', N'SQL', N'SELECT person_name, title FROM person
JOIN movie_actor ON actor_id = person_id
JOIN movie ON movie.movie_id = movie_actor.movie_id
WHERE person_name LIKE ''% Jones''
ORDER BY person_name, title', N'Exercises', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1040, 2, N'COUNT()', N'tables', N'SQL', N'SELECT COUNT(*) AS total_users FROM users;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1041, 2, N'SUM()', N'tables', N'SQL', N'SELECT SUM(sales_amount) AS total_sales FROM transactions;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1042, 2, N'AVG()', N'tables', N'SQL', N'SELECT AVG(age) AS average_age FROM employees;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1043, 2, N'MIN() / MAX()', N'tables', N'SQL', N'SELECT MIN(product_price) AS lowest_price FROM products;

SELECT MAX(order_total) AS highest_order_total FROM orders;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1044, 2, N'GROUP BY', N'tables', N'SQL', N'SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS num_employees
FROM employees
GROUP BY department;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1045, 2, N'Declaring Variables', N'variables', N'JavaScript', N'let name = ''Tyler'';
const age = 29;
var favoriteFood = ''Pizza'';', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1046, 2, N'Variable Type Conversion', N'parsing', N'JavaScript', N'let numString = ''10'';
let num = parseInt(numString); // Convert string to integer', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1047, 2, N'String Concatenation', N'strings', N'JavaScript', N'let greeting = ''Hello'';
let name = ''John'';
let message = `${greeting}, ${name}!`; // String interpolation', N'Self-derived', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1048, 2, N'Anonymous Function', N'functions', N'JavaScript', N'let add = function (a, b) {
    return a + b;
};', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1049, 2, N'Fat Arrow Notation', N'functions', N'JavaScript', N'let multiply = (a, b) => a * b;', N'ChatGPT', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1050, 2, N'forEach', N'Arrays', N'JavaScript', N'const numbers = [1, 2, 3, 4];

numbers.forEach( (number) => {
    console.log(`This number is ${number}`);
});', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1051, 2, N'Map', N'Arrays', N'JavaScript', N'const numbersToSquare = [1, 2, 3, 4];

const squaredNumbers = numbersToSquare.map( (number) => {
    return number * number;
});

console.log(squaredNumbers);  // displays [1, 4, 9, 16]', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1052, 2, N'Filter', N'Arrays', N'JavaScript', N'const numbersToFilter = [1, 2, 3, 4, 5, 6];

const filteredNumbers = numbersToFilter.filter( (number) => {
    // Only keep numbers divisible by 3
    return number % 3 === 0;
});

console.log(filteredNumbers);  // displays [3, 6]', N'Bootcamp-OS', N'Public')
GO
INSERT [dbo].[examples] ([example_id], [user_id], [example_title], [example_tag], [example_language], [example_code], [example_source], [example_status]) VALUES (1053, 2, N'Reduce', N'Arrays', N'JavaScript', N'const pointsArray = [21, 11, 32, 24, 21];

const totalPoints = pointsArray.reduce( (previousPointsTotal, currentPoints) => {
    return previousPointsTotal + currentPoints;
}, 0);

console.log("Total points: " + totalPoints);  // displays 109', N'Bootcamp-OS', N'Public')
GO
SET IDENTITY_INSERT [dbo].[examples] OFF
GO