<template>
  <navBar></navBar>
  <h1 class="title">Admin Tools</h1>
  <div v-if="$store.state.user.role == 'admin'" class="container">
    <p>Total examples: {{ examples.length }}</p>
    <div class="table-wrapper">
      <table class="admin-table">
        <thead>
          <tr id="header">
            <th id="head-elements">Title</th>
            <th id="head-elements">Tag</th>
            <th id="head-elements">Language</th>
            <th id="head-elements">Source</th>
            <th id="head-elements">Code</th>
            <th id="head-elements">Status</th>
            <th id="head-elements">Toggle Status</th>
            <th id="head-elements">Edit/Save Changes</th>
          </tr>
          <tr class="filters">
            <td>
              <input type="text" v-model="filter.title" placeholder="search" />
            </td>
            <td>
              <input type="text" v-model="filter.tag" placeholder="search"/>
            </td>
            <td>
              <input type="text" v-model="filter.language" placeholder="search"/>
            </td>
            <td>
              <input type="text" v-model="filter.source" placeholder="search"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <select id="statusFilter" v-model="filter.status">
                <option value>Show All</option>
                <option value="Public">Public</option>
                <option value="Private">Private</option>
                <option value="Pending">Pending</option>
              </select>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="example in filteredList" :key="example.id">
            <td>
              <input type="text" v-model="example.title" :disabled="!example.editMode">
            </td>
            <td>
              <input type="text" v-model="example.tag" :disabled="!example.editMode">
            </td>
            <td>
              <input type="text" v-model="example.language" :disabled="!example.editMode">
            </td>
            <td>
              <input type="text" v-model="example.source" :disabled="!example.editMode">
            </td>
            <td>
              <input type="text" v-model="example.code" :disabled="!example.editMode">
            </td>
            <td>
              <span :class="{ pending: example.status === 'Pending' }">{{ example.status }}</span>
            </td>
            <td>
              <button :class="{ pending: example.status === 'Pending' }" @click="toggleStatus(example.id)">{{ example.status }}</button>
            </td>
            <td>
              <button v-if="!example.editMode" @click="toggleEditMode(example)">Edit</button>
              <button v-else @click="confirmChanges(example)">Save</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div v-else>You are not authorized to view this page</div>
</template>


<script>
import exampleService from '../services/ExampleService';
import navBar from '@/components/NavBar.vue';
export default {
    components: {
        navBar
    },
    data() {
        return {
            examples: [],
            exampleStatus: '',
            filter: {
                title: "",
                tag: "",
                language: "",
                source: "",
                code: "",
                status: "",
            }
        }
    },
    methods: {
        confirmChanges(example) {
            exampleService.updateExample(example);
            example.editMode = false;
        },
        toggleStatus(exampleId) {
            const example = this.examples.find((example) => example.id === exampleId);
            console.log(example.id)
            if (example) {
                if (example.status == 'Public') {
                    example.status = 'Private';
                } else {
                    example.status = 'Public'
                }
                exampleService.updateExample(example)
                console.log(example)
            }
        },
        toggleEditMode(example) {
            example.editMode = !example.editMode;
        },
    },
    created() {
        exampleService
            .getExamples(this.exampleStatus)
            .then((response) => {
                console.log("Reached LOAD_EXAMPLES in AdminTasksView.vue");
                console.log(response);
                this.examples = (response.data);
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
    },
    computed: {
        filteredList() {
            let filteredExamples = this.examples;
            if (this.filter.title != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.title
                        .toLowerCase()
                        .includes(this.filter.title.toLowerCase())
                );
            }
            if (this.filter.tag != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.tag
                        .toLowerCase()
                        .includes(this.filter.tag.toLowerCase())
                );
            }
            if (this.filter.language != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.language
                        .toLowerCase()
                        .includes(this.filter.language.toLowerCase())
                );
            }
            if (this.filter.source != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.source
                        .toLowerCase()
                        .includes(this.filter.source.toLowerCase())
                );
            }
            if (this.filter.status != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.status === this.filter.status
                );
            }
            return filteredExamples;
        }
    }
}
</script>

<style scoped>
* {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
        Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

.table-wrapper {
    max-height: auto;
    /* Set a maximum height for the tbody */
    overflow-y: auto;
    /* Enable vertical scrollbar when content exceeds the height */
}


.admin-table {
    border-collapse: collapse;
    width: 100%;
    border:1px solid grey;
}

.title {
    text-align: center;
    margin: 3rem;
    font-size: 2rem;
    padding-top: 2rem;
}

/* Example counter text p element */
p {
    margin: 0;
    font-size: 1.5rem;
}

/* Input boxes for editing */
input {
    width: 100%;
    box-sizing: border-box;
    padding: 8px;
}

/* Bound classes that change color if there is a pending request for public from user */
button.pending {
    color: red;
}

tr.pending {
    color: red;
}

/* Table header display text for each column */
th {
    text-transform: uppercase;
    height: 50px;
    background-color: #2c3e50;
    /* Dark blue for table headers */
    color: white;
    /* White text for better contrast */
}

td {
    padding: 10px;
    text-align: center;
}


.admin-table td {
    /* Adding a border to all table cells */
    padding: 20px;
}


thead {
    text-align: center;
    padding-top: 5px;
    background-color: #2c3e50;
	display:table;
	width:100%;
}

.admin-table .filters input[type="text"],
.admin-table .filters select {
    width: 100%;
    box-sizing: border-box;
    /* Include padding and border in the width */
}


.admin-table tbody tr:nth-child(even) {
    background-color: #f5f5f5;
}

/* Status filter dropdown size*/
#statusFilter {
    width: 5.3rem;
}

table {
    max-width: 95%;
	margin:auto;
}
th, td {
	padding:5px 10px;
}
tbody {
	height:38rem;
	overflow:auto;
	overflow-x:hidden;
	display:block;
	width:100%;
}
tbody tr {
	display:table;
	width:100%;
	table-layout:fixed;
}
#head-elements {
    width:9.5%;
}

</style>