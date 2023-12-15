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
/* Wraps whole table */
.table-wrapper {
  max-height: auto;
  /* Set a maximum height for the tbody */
  overflow-y: auto;
  /* Enable vertical scrollbar when content exceeds the height */
}
/* Class styling for whole table tag */
.admin-table {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid grey;
}
/* Page title */
.title {
    text-align: center;
    margin: 3rem;
    font-size: 2rem;
    padding-top: 2rem;
}
/* Counter styling */
p {
  margin: 0;
  font-size: 1.5rem;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  display: inline-block;
  margin-bottom: 1rem;
  margin-left: 3rem;
}
/* Input text sections */
input {
  width: 100%;
  box-sizing: border-box;
  padding: 8px;
}
/* Bound classes that change color if there is a pending request for public from user */
button.pending, tr.pending {
  color: red;
}
/* Table header data elements */
th {
  text-transform: uppercase;
  height: 50px;
  background-color: #2c3e50;
  /* Dark blue for table headers */
  color: white;
  /* White text for better contrast */
}
/* Table body data elements */
.admin-table td {
  padding: 20px;
  text-align: center;
}

/* Thead styling */
thead {
    text-align: center;
    padding-top: 5px;
    background-color: #2c3e50;
	display:table;
	width:100%;
}
/* Filter box styling */
.admin-table .filters input[type="text"],
.admin-table .filters select {
  width: 100%;
  box-sizing: border-box;
}
/* Style for every other row in table background color */
.admin-table tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}
/* Slight changes to width of dropdown filter */
#statusFilter {
  width: 5.3rem;
}
/* Table spacing */
table {
  max-width: 95%;
  margin: auto;
}
/* th and td styling */
th,
td {
  padding: 10px;
}
/* Styling for tbody element */
tbody {
  height: 38rem;
  overflow: auto;
  overflow-x: hidden;
  display: block;
  width: 100%;
}
/* rows in tbody */
tbody tr {
  display: table;
  width: 100%;
  table-layout: fixed;
}
/* styling for header th elements for spacing and alignment */
#head-elements {
    width:9.5%;
}

</style>