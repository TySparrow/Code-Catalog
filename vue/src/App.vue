<template>
  <div class="main">
    <aside class="topnav">
      <li><img src="src\assets\techelevatorimage.png" alt="Logo" class="logo" v-on:click="returnHome"></li>

      <!-- <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp; -->
      <div id="yes">

      <li><router-link id="tab" v-bind:to="{ name: 'newExample' }" v-show="$store.state.token != ''">Add New Snippet</router-link> </li>
      <li><router-link id="tab" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link></li>

    </div>
    </aside>
    <router-view class="body"/>
  </div>
</template>

<script>
export default {
  created() {
    this.$store.commit("LOAD_EXAMPLES");
  },
  methods: {
    returnHome() {
      this.$router.push({ name: 'home' })
    }
  },
}
</script>

<style>
* {
  box-sizing: border-box;
}

.body{
  padding: 16px;
  margin-top: 30px;
  height: 1500px;
}

.topnav {
  overflow: hidden;
  background-color: #f5f5f5;;
  position: fixed;
  list-style-type: none;
  top: 0;
  width: 100%;
  white-space:nowrap;
  display:inline-flex;

}
#yes{
  position:fixed;
  padding-left: 70%;
}
.topnav li {

  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  display:inline-flex;

}
#tab{
color:#00ADEE;
text-decoration: none;
}
.logo {
  width: 60px;
  height: auto;
  margin-right: 1rem;
  cursor: pointer;

}
</style>


