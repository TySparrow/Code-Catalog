<template>
  <NavBar></NavBar>
  <div class="home">
    <modal @close="toggleModal" :modalActive="modalActive" v-if:="this.$store.state.user.role == 'admin' ">
      <div class="modal-content">
        <table class="admin-table">
            <thead>
                <tr class="table-header">
                    <th>Title</th>
                    <th>Tag</th>
                    <th>Language</th>
                    <th>Source</th>
                    <th>Code</th>
                    <th>Toggle Status</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="example in pendingExamples" v-bind:key="example.id">
                    <td>
                        <p>{{ example.title }}</p>
                    </td>
                    <td>
                      <p>{{ example.tag }}</p>
                    </td>
                    <td>
                      <p>{{ example.language }}</p>
                    </td>
                    <td>
                      <p>{{ example.source }}</p>
                    </td>
                    <td>
                      <p>{{ example.code }}</p>
                    </td> 
                    <td>
                      <p>{{ example.status }}</p>
                    </td>
                </tr>
            </tbody>
        </table>
      </div>
    </modal>
    <div class="content">
      <h1>Welcome to Your Code Catalog</h1>
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
import modal from '../components/PopUp.vue'
import exampleService from '../services/ExampleService';
import{ref} from "vue";
export default {
  name: 'home',
  components: { NavBar, Footer, modal
  },
  data(){
    return{
      pendingExamples: [],
    }
  },
  setup() {
    const modalActive = ref(true);

    const toggleModal = () => {
      modalActive.value = !modalActive.value;
    };
    return { modalActive, toggleModal };
  },
  created(){
    let exampleStatus = 'pending';
        exampleService
          .getExamples(exampleStatus)
          .then((response) => {
            console.log("Reached LOAD_EXAMPLES in homeview.vue");
            console.log(response);
            this.pendingExamples = (response.data);
          })
          .catch((error) => {
            if (error.response) {
              // error.response exists
              // Request was made, but response has error status (4xx or 5xx)
              console.log("Error loading EXAMPLES: ", error.response.status);
            } else if (error.request) {
              // There is no error.response, but error.request exists
              // Request was made, but no response was received
              console.log(
                "Error loading EXAMPLES: unable to communicate to server"
              );
            } else {
              // Neither error.response and error.request exist
              // Request was *not* made
              console.log("Error loading EXAMPLES: make request");
            }
          });

  }
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


