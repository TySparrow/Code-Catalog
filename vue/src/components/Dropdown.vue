<template>
    <div>
        <button class="dropdown-menu" @click="toggleDropDown">
            Menu
        </button>
        <div v-if="showDropDown" class="dropdown-content" v-on:mouseleave="closeDropDown">
            <li class="dropdown-item" v-on:click="createSnippet">Add New Code Snippet</li>
            <router-link v-bind:to="{ name: 'logout' }" class="dropdown-item">Logout</router-link>

        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            showDropDown: false
        }
    },
    methods: {

        toggleDropDown() {
            this.showDropDown = !this.showDropDown;
        },
        closeDropDown() {
            this.showDropDown = false;
        },
        createSnippet() {
            this.$router.push({ name: 'newExample' })
            this.closeDropDown();
        }
    }
}

</script>


<style scoped>
/* Style the button */
.dropdown-menu {
    padding: 10px 20px;
    position:relative;
    text-align: center;
    border: none;
    border-radius: 2px;
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
    background-color: #f9f9f9;
    min-width: 150px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    padding: 5px;
    right:0%;
    position: fixed;
    
}


.dropdown-item {
    display: flex;
    padding: 5px 10px;
    height: 40px;
    justify-content: center;
    color: #333;
    cursor: pointer;
    text-align: center;
}

.dropdown-item:hover {
    cursor: pointer;
    transition: 0.3s;
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
}
</style>

