<template>
    <div id="login">
      <div class="login-container">
        <img src="../assets/TechElevator_fullLogo.png" alt="Logo" class="logo">
       
        <form v-on:submit.prevent="login" class="login-form">
          <h1 class="login-heading">Please Sign In</h1>
          <div role="alert" v-if="invalidCredentials" class="error-message">
            Invalid username and password!
          </div>
          <div role="alert" v-if="this.$route.query.registration" class="success-message">
            Thank you for registering, please sign in.
          </div>
          <div class="form-input-group">
            <label for="username">Username </label>
            <input type="text" id="username" v-model="user.username" required autofocus />
          </div>
          <div class="form-input-group">
            <label for="password">Password </label>
            <input type="password" id="password" v-model="user.password" required />
          </div>
          <button type="submit" class="form-button">Sign in</button>
          <p class="register-link">
            <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
          </p>
        </form>
      </div>
    </div>
    <Footer></Footer>
</template>

<script>
import authService from "../services/AuthService";
import Footer from "../components/Footer.vue";

export default {
  name: 'home',
  components: { Footer
  },
  
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
#login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
 
}

.logo {
  width: 550px;
  height: auto;
  margin-right: 5rem;
}

.login-form {
  width: 300px;
  padding: 2rem;
  background-color: #f5f5f5;
  border-radius: 5px;
}
.login-heading {
  text-align: center;
  margin-bottom: 1.5rem;
}

.error-message {
  color: red;
  margin-bottom: 1rem;
}

.success-message {
  color: green;
  margin-bottom: 1rem;
}

.form-input-group {
  margin-bottom: 1rem;
}

.form-button {
  width: 100%;
  padding: 0.5rem;
  background-color: #00ADEE;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.register-link {
  text-align: center;
  margin-top: 1rem;
  color:#8CC36F;
}
</style>