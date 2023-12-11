<template>
  <div id="register" class="text-center">

    <img src="../assets/TechElevator_fullLogo.png" alt="Logo" class="logo">
   
    <form v-on:submit.prevent="register" class="register-form">
      <h1 class="register-heading">Create Account</h1>
      <p class="subheading"> It's quick and easy.</p>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
      </div>
      <input type="text" id="username" v-model="user.username" required autofocus  class="form-input-group"/>
      <div class="form-input-group">
        <label for="password">Password</label>
      </div>
      <input class="form-input-group" type="password" id="password" v-model="user.password" required />
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" v-model="user.confirmPassword" required />
      </div>
      <button type="submit" class="form-button">Create Account</button>
      <p><router-link v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
#register {
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
.subheading {
  margin-bottom: 1.5rem;
  font-size: 11px;
  text-align: center;

}

.form-input-group {
  margin-bottom: 1rem;
}

.register-form {
  width: 300px;
  padding: 2rem;
  background-color: #f5f5f5;
  border-radius: 5px;
}

.register-heading {
  text-align: center;
  margin-bottom: 1.5rem;
}

.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

.form-input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 3px;
  box-sizing: border-box;
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
</style>
