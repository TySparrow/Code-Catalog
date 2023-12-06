<template>
   <div>
      <button class="dropdown-menu" v-on:click="showDropDown = !showDropDown">
         Hello {{ currentUser}} current user 
      </button>
      <div v-if="showDropDown" class="dropdown-content">
        <li class="dropdown-item" v-on:click="createSnippet">Add New Code Snippet</li>
        <a href="#"><li class="dropdown-item">Logout</li></a>

        <!-- TODO-- Link to logout user. Link to username based on current user object. Continue styling -->

      </div>
    </div>
</template>

<script>

export default {
    data () {
        return {
            showDropDown: false
        }
    },
    methods: {
        createSnippet() {
            this.$router.push({name: 'newExample'})
        }
    }
}

</script>


<style scoped>
/* Style the button */
.dropdown-menu {
    padding: 10px 20px;
    position: relative;
    text-align: center;
    border: none;
    border-bottom: 3px solid transparent;
    display: inline-block;
    transition: 0.3s;
    flex-wrap: wrap;
}

.dropdown-menu:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
    cursor: pointer;
}
.dropdown-content {
  position: absolute;
  background-color: #f9f9f9;
  min-width: 150px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  
}
.dropdown-item {
    display:flex;
    width: 175px;
    height: 50px;
    justify-content:center;
}

.dropdown-item:hover {
    cursor: pointer;
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
}
</style>

