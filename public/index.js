/* global axios */

var recipeTemplate = document.querySelector("#recipe-card");
var recipeRow = document.querySelector(".row");

axios.get("https://pacific-sands-11450.herokuapp.com/recipes").then(function(response) {
  var recipes = response.data; //array or recipe data
  console.log(response.data);

  recipes.forEach(function(recipe){
    var recipeCard = recipeTemplate.content.cloneNode(true);
    recipeCard.querySelector(".card-title").innerText = recipe.title;
    recipeCard.querySelector(".card-img-top").src = recipe.image;
    recipeCard.querySelector(".ingredients").innerText = recipe.ingredients;
    recipeCard.querySelector(".directions").innerText = recipe.directions;
    recipeRow.appendChild(recipeCard);
  })
})
