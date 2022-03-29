
<template>
  <section id="login" class="content-section">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <div class="card">
            <div class="card-body">
              <div class="block-heading">
                <h2>Login</h2>
                <a href="/" class="smooth-scroll">Back to home</a>
                <div v-for="error in errors" :key="error">
                  <p class="text-danger">{{ error }}</p>
                </div>
              </div>
              <form @submit.prevent="login">
                <div class="form-group">
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    placeholder="name@example.com"
                    @blur="validateEmail()"
                    v-model="email"
                  />
                </div>
                <div class="form-group">
                  <input
                    type="password"
                    class="form-control"
                    id="name"
                    v-model="password"
                    @blur="validatePassword()"
                    placeholder="password"
                  />
                </div>

                <div class="submit-btn">
                  <button class="btn btn-primary" type="submit">Submit</button>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <router-link class="smooth-scroll" to="/register"
                      >{{statusMessage}}</router-link
                    >
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
import apiClient from "../../services/client";
export default {
  name: "Login",
  data() {
    return {
      password: "",
      email: "",
      disabled: true,
      errors: [],
      statusMessage:"Register"
    };
  },
  methods: {

    reload(){
      window.location.reload()

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

    validatePassword() {
      this.errors = [];
      if (this.password !== "") {
        return true;
      } else {
        let error = "Password not long enough";
        this.errors.push(error);
        return false;
      }
    },
    async login() {
      this.statusMessage = "Please wait"
      let emailCheck = this.validateEmail(this.email);
      let passwordCheck = this.validatePassword();
      const url = "/login_check";

      if (emailCheck && passwordCheck) {
        const headers = {
          Accept: "application/json",
        };

        try {
          const data = {
            username: this.email,
            password: this.password,
          };

          let result = await apiClient.post(url, data, { headers });

          if (result.status == 200) {
            this.statusMessage = "Register"
            let content = result.data.token;
            localStorage.setItem("user", JSON.stringify(data));
            localStorage.setItem("token", JSON.stringify(content));
            return this.$router.push({ name: "Content" });
          }
        } catch (error) {
          this.statusMessage = "Register"
          this.errors = [];
     
          
            if(error.response.status>=500){
             this.errors.push("Server error has occured");

          }
           if(error.response.status>=400){
  
             this.errors.push(error.response.data.message);

          }

          
          return error;
        }
        return true;
      } else {
        this.errors = [];
        this.errors.push("Invalid data received");
        this.statusMessage = "Login"
        console.log(this.errors);
      }
    },
  },
};
</script>