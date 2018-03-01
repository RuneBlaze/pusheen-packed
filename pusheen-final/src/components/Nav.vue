<template>
<nav class="navbar navbar-expand-sm navbar-light" style="background-color: white; box-shadow:0 2px 4px 0 rgba(0,0,0,0.2); margin-bottom:20px;padding:0px;">
   <div class="container">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <a href="/"><img src="../assets/pusheen_blue_nobkg.png" style="max-width:100px; float:right;"></a>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
         <ul class="navbar-nav mr-auto mt-2 mt-lg-0" >
<!--             <li class="nav-item">
               <router-link class="nav-link" to="/">Home</router-link>
            </li> -->
            <li class="nav-item">
               <router-link class="nav-link" to="/#findcards">Find a new credit card</router-link>
            </li>
         </ul>
      </div>
   </div>
</nav>
</template>

<script>
import {retrieveCards, applyCard, cards} from '../rv'
export default {
  name: 'PusheenNav',

  data () {
    return {
      
    }
  },

  methods: {
    apply () {
      applyCard(82457245, this.creditScore, (err, res) => {
        if (err) alert(err)
        else {
          alert(JSON.stringify(res))
        }
      })
    }
  }

}
</script>

<style scoped>
.navbar-light .navbar-nav .nav-link{
  color:#242942;
}
.navbar-nav{
  padding-left: 50px;
}
.navbar-collapse{
  flex-grow:0;
}
</style>
