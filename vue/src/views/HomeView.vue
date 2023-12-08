<template>
  <NavBar></NavBar>
  <div class="home">

    <div class="content">
      <h1>Welcome to Your Catalog</h1>
      <p></p>
      <router-link to="/new-example">
        <button class="button">Get Started</button>
      </router-link>
    </div>
  </div>
  <Footer></Footer>
</template>

<script>
import NavBar from '../components/NavBar.vue';
import Footer from '../components/Footer.vue';
export default {
  name: 'home',
  components: { NavBar, Footer
  },
}

</script>

<style scoped>
.home {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.content {
  text-align: center;
  padding: 20px;

}

.navbar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 999;
}

h1 {
  font-size: 48px;
  color: #333;
  margin-bottom: 20px;
}

p {
  font-size: 24px;
  color: #666;
  margin-bottom: 30px;
}

.button {
  padding: 12px 24px;
  font-size: 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.cta-button:hover {
  background-color: #0056b3;
}
</style>


