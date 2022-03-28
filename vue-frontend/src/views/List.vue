<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
    <a class="navbar-brand" href="#">Dev Hub</a>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <router-link class="nav-link" to="/content">Dashboard</router-link>
        </li>

        <li class="nav-item">
          <router-link class="nav-link" to="/">Home</router-link>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" @submit.prevent="searchData">
        <input
          class="form-control mr-sm-2"
          type="search"
          v-model="search"
          placeholder="Search"
          aria-label="Search"  
        />
      </form>
    </div>
  </nav>
  <div class="container">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="exampleFormControlSelect1">Filter By</label>
              <select v-model="filter" class="form-control" id="filter">
                <option value="">All</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="rather not say">Rather not say</option>
              </select>
            </div>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-md-12">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">First</th>
                  <th scope="col">Last</th>
                  <th scope="col">Handle</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="data in filteredList" :key="data.id">
                  <th scope="row">{{ data.id }}</th>
                  <td>{{ data.username }}</td>
                    <td>{{ data.email}}</td>
                  <td>{{ data.gender }}</td>
                  <td>{{ data.content }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import apiClient from "../services/client";
export default {
  name: "List",
  data() {
    return {
      allData: [],
      tempData: [],
      search: "",
      filter:"",
    };
  },

  mounted() {
    this.loadData();
  },
  computed: {
    filteredList() {
      if (this.search) {
        const searchList = this.allData.filter((item) => {
          return item.name
            .toLowerCase()
            .includes(this.search.toLowerCase());
        });

        return searchList;
      } 
      else if(this.filter){
        const searchList = this.allData.filter((item) => {
          return item.gender.toLowerCase()===this.filter.toLowerCase();
        });

        return searchList;

      }
      else {
        return this.allData;
      }
    },
  },
  methods: {
    async loadData() {
      console.log('loading d')
      const url = "/contact";
      const tokenVar = localStorage.getItem("token");
      const token = JSON.parse(tokenVar)
      const headers = {
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      };

      try {
        let result = await apiClient.get(url, { headers });

        if (result.status == 200) {
          let content = result.data;
          return this.allData = content;
         
        }
      } catch (error) {
        return error;
      }
      return [];
    },
  },
};
</script>