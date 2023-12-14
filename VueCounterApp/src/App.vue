<script setup> 
import { ref } from 'vue'
const count = ref(0);
</script>

<template>
  <main>
    <div>
      <h4>
        The Current Count is...
      </h4>
      <h1>{{ count }}</h1>
      <button @click="count--">-</button>  <button @click="count++">+</button>
    </div>
  </main>
</template>

<style scoped>
main {
  height: 100vh;
  width: 100vw;
  background-color: aliceblue;
  display: flex;
  align-items: center;
  justify-content: center;
}

div {
  background-color: white;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  text-align: center;
}
h4{
  color: black;
  font-weight: bold;
  font-size: 40px;
}
h1 {
  color: black;
  font-size: 100px;
  margin: 0;
}
</style>