
<template>
  <!-- Navigation -->
  <div class="logo">
    <i class="fa fa-plane" aria-hidden="true"><span>Dev Hub</span></i>
  </div>
  <a class="menu-toggle rounded" href="#">
    <i class="fa fa-bars"></i>
  </a>
  <nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a class="smooth-scroll" href="#Header"></a>
      </li>
      <li class="sidebar-nav-item">
        <a class="smooth-scroll" href="#page-top">Home</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="smooth-scroll" href="#Contact">Contact</a>
      </li>

      <li v-if="!user" class="sidebar-nav-item">
        <router-link class="smooth-scroll" to="/login">Login</router-link>
      </li>

      <li v-if="user" class="sidebar-nav-item">
        <router-link class="smooth-scroll" to="/content">Content</router-link>
      </li>

      <li v-if="user" class="sidebar-nav-item">
        <a @click="logout()" class="smooth-scroll">Logout</a>
      </li>

      <li v-if="!user" class="sidebar-nav-item">
        <router-link class="smooth-scroll" to="/register">Register</router-link>
      </li>
    </ul>
  </nav>
  <!-- Header Starts -->
  <section id="Banner" class="content-section">
    <div class="container content-wrap text-center">
      <h1>Dev Hub</h1>
      <h3>
        <em>All we do is program</em>
      </h3>
    </div>
    <div class="overlay"></div>
  </section>
  <!-- Header Ends -->

  <section id="Contact" class="content-section">
    <div class="container">
      <div class="block-heading">
        <h2>Contact Us</h2>
      </div>
      <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <div v-for="error in errors" :key="error">
            <p class="text-danger">{{ error }}</p>
          </div>
          <p v-if="serverSuccess" class="text-success">
            Thank you we will be in touch!
          </p>
          <p v-if="serverError" class="text-danger">
            We have hit an obstacle try again!
          </p>

          <!-- <form @submit.prevent="onSubmit"> -->
          <form @submit.prevent="contact">
            <div class="form-group">
              <input
                type="text"
                class="form-control"
                id="name"
                v-model="name"
                placeholder="John Doe"
              />
            </div>
            <div class="form-group">
              <input
                type="email"
                class="form-control"
                v-model="email"
                id="email"
                placeholder="name@example.com"
              />
            </div>

            <div class="form-group">
              <select
                v-model="gender"
                class="form-control"
                id="exampleFormControlSelect1"
              >
                <option>Male</option>
                <option>Female</option>
                <option>Rather not say</option>
              </select>
            </div>

            <div class="form-group">
              <textarea
                v-model="content"
                class="form-control"
                id="content"
                rows="6"
              ></textarea>
            </div>

            <div class="submit-btn">
              <button class="btn btn-primary" type="submit">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import apiClient from "../services/client";
export default {
  name: "Home",
  data() {
    return {
      user: null,
      email: "",
      name: "",
      gender: "",
      content: "",
      serverError: "",
      serverSuccess: "",
      errors: [],
    };
  },
  mounted() {
    this.user = localStorage.getItem("user");
  },

  methods: {
    logout() {
      localStorage.clear();
      return this.$router.push({ name: "Login" });
    },
    validateEmail() {
      this.errors = [];
      if (
        /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(
          this.email
        )
      ) {
        return true;
      } else {
        let error = "Please enter a valid email address";
        this.errors.push(error);
        return false;
      }
    },
    validateName() {
      this.errors = [];
      if (this.name.length > 4) {
        return true;
      }
      let error = "Name should be at least 3 characters";
      this.errors.push(error);
      return false;
    },

    validateContent() {
      this.errors = [];
      if (this.name.length > 6) {
        return true;
      }
      let error = "Message not long enough";
      this.errors.push(error);
      return false;
    },

    async contact() {
      this.errors = [];
      const url = "/contact/create";
      const data = {
        email: this.email,
        name: this.name,
        gender: this.gender,
        content: this.content,
      };

      if (this.validateContent && this.validateEmail && this.validateName) {
        const headers = {
          Accept: "application/json",
        };

        try {
          let result = await apiClient.post(url, data, { headers });

          if (result.status == 200) {
            this.serverSuccess="Thank you we have received your message"
            this.errors = [];
            return this.$router.push({ name: "Index" });
          }
        } catch (error) {
          return this.serverError="Error encountered";
        }

        return data;
      }
      return false;
    },
  },
};
</script>