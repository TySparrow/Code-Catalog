<template>
    <div class = "example"> 
          <p >Language:{{ item.language }}</p>
          <p >title:{{ item.title }}</p>
          <p >code:{{ item.code }}</p>
          <p >id:{{ item.id }}</p>
    </div>
  </template>
  <script>
  export default {
      name: 'example',
      props: ["item"]
  }
  </script>
  <style scoped>
   .example {
    flex-wrap: wrap;
    display: inline-block;
    height: 12rem;
    min-width: 300px;
    border: 2px solid black;
    border-radius: 10px;
    margin: 20px;
    background-color: tan;
  }
  
  </style>
  
  
  
  
  