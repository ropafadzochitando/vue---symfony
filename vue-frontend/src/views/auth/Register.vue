
<template>
  <section id="login" class="content-section">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <div class="card">
            <div class="card-body">
              <div class="block-heading">
                <h2>Register</h2>
                 <div v-for="error in errors" :key="error">
                  <p class="text-danger">{{ error }}</p>
                </div>
              </div>
              <form @submit.prevent="register">
                <div class="form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    v-model="username"
                    placeholder="John Doe"
                  />
                </div>
                <div class="form-group">
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    v-model="email"
                    placeholder="name@example.com"
                  />
                </div>
                <div class="form-group">
                  <input
                    type="password"
                    class="form-control"
                    v-model="password"
                    id="password"
                    placeholder="password"
                  />
                </div>

                <div class="form-group">
                  <input
                    type="password"
                    class="form-control"
                    id="password_verify"
                    v-model="password_verify"
                    placeholder="verify password"
                  />
                </div>

                <div class="submit-btn">
                  <button class="btn btn-primary" type="submit">Submit</button>
                </div>
                <router-link class="smooth-scroll"  to="/login">Login</router-link>
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
  name: "Register",
  data() {
    return {
      password: "",
      email: "",
      password_verify:"",
      disabled: true,
      errors: [],
    };
  },
  methods: {
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
      if (this.password !== "" && this.password.length>6) {
        return true;
      } else {
        let error = "Password not long enough";
        this.errors.push(error);
        return false;
      }
    },

    checkVerifyPassword(){
        this.errors = []
        
        if(this.password === this.password_verify){
           
            return true
        }
        this.errors.push("Passwords do not match")
        return false

    },
    async register() {
      let emailCheck = this.validateEmail(this.email);
      let passwordCheck = this.validatePassword();
      let verify = this.checkVerifyPassword()
      const url = "/register";
      if (emailCheck && passwordCheck && verify) {
        const headers = {
          Accept: "application/json",
        };

        try {
          const data = {
            email: this.email,
            password: this.password,
          };

          let result = await apiClient.post(url, data, { headers });

          if (result.status == 200) {
            //let content = result.data;

            return this.$router.push({ name: "Login" });
          }
        } catch (error) {
          return error;
        }
        return true;
      } else {
        this.errors = [];
        this.errors.push("Invalid data received");
        console.log(this.errors);
      }
    },
  },
};

</script>