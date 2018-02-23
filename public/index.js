/* global Vue, VueRouter, axios */

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          console.log(response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var RecipesIndexPage = {
  template: "#recipe-index-page",
  data: function() {
    return {
      recipes: [],
      currentRecipe: {}
    };
  },
  created: function() {
    axios.get("http://localhost:3000/recipes").then(function(response) {

      this.recipes = response.data; //array or recipe data
      console.log(response.data);

    }.bind(this));
  },
  methods: {
    setCurrentRecipe: function(recipe) {
      this.currentRecipe = recipe;
      console.log(this.currentRecipe);
    }
  }
};

var RecipesNewPage = {
  template: "#recipes-new-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      prep_time: "",
      directions: "",
      image: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        title: this.title,
        ingredients: this.ingredients,
        prep_time: this.prep_time,
        directions: this.directions,
        image: this.image
      };
      axios
        .post("/recipes", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var RecipesShowPage = {
  template: "#recipes-show-page",
  data: function() {
    return {
      recipe: {}
    };
  },
  created: function() {
    axios.get("/recipes/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.recipe = response.data;
    }.bind(this));
  }
}

var router = new VueRouter({
  routes: [
   { path: "/", component: RecipesIndexPage },
   { path: "/signup", component: SignupPage },
   { path: "/login", component: LoginPage },
   { path: "/logout", component: LogoutPage },
   { path: "/recipes/new", component: RecipesNewPage },
   { path: "/recipes/:id", component: RecipesShowPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
