//Chapter 2 Cypher Query Language

//Create a project, a DBMS and a database

create database person

//switch to person database

//1. Create nodes and relationships




//add a new person and relationship. This will NOT add the new node to the existing graph.



//delete all nodes and relationships


//use merge. Since nodes are created in another query, we need to first MATCH the nodes of interest



// Update
// add a property hobby to Mary



// import file from local folder. Need to store the files in the import folder of database

//first delete existing nodes and relationships since we will look at another graph

match (n)
detach delete (n)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/Suhong88/isa360_spring2022/main/data/usa_state_neighbors_edges.csv"  AS row
fieldterminator ';'
merge(n: State {code: row.code})
merge(m:State {code: row.neighbor_code})
merge(n)-[:SHARE_BORDER_WITH]->(m)

//pattern matching and data retrieval
//Find the direct neighbors of Florida and return their names:



//Find the neighbors of the neighbors of Florida.



//Find the neighbors of the neighbors of Florida. Remove direct neighbor.



// Variable length patterns
//2 hops



//2-3 hops



//all hops




//aggregation functions: Count, sum and average

//display number of neighbors of Florida



// Create a list of objects. Display all direct neighbors of Florida



//unwind function. 



// load the dataset stored in different format
match (n)
detach delete (n)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/Suhong88/isa360_spring2022/main/data/usa_state_neighbors_all.csv"  AS row
fieldterminator ';'
with row.ucode as name, split(row.neighbors, ",") as neighbors
unwind neighbors as neighbor
with name, neighbor
merge(n: State {name: name})
merge(m: State {name: trim(neighbor)})
merge(n)-[:SHARE_BORDER_WITH]->(m)