<template>

<div>

<pusheen-nav></pusheen-nav>
<nav class="container">
    <div class="row">
        <div class="col-md-12">
            <!--<p align="center">site navigation here.</p>-->
        </div>
    </div>
</nav>
<article class="container">
    <div class="row">
        <div id="form" class="col-md-8">
             <router-link :to="{ name: 'card', params: { id: 2 }}" style="color: gray">Back</router-link>
          
            <h2 class="title">Credit Card Application</h2>
            <form class="text">
                <div class="row prompt">
                    <div class="col-md-4">
                        <p>First name</p>
                        <input class="input" type="text" title="firstName" v-model="user.first">
                    </div>
                    <div class="col-md-2">
                        <p>M. I.</p>
                        <input class="input" v-model="user.mi" type="text" title="middleInitial">
                    </div>
                    <div class="col-md-4">
                        <p>Last name</p>
                        <input class="input" v-model="user.last" type="text" title="lastName">
                    </div>
                </div>
                <div class="row prompt">
                    <div class="col-md-10">
                        <p>Address</p><input v-model="user.address" class="input" type="text" title="address">
                    </div>
                </div>
                <div class="row prompt">
                    <div class="col-md-4">
                        <p>City</p><input v-model="user.city" class="input" type="text" title="city">
                    </div>
                    <div class="col-md-3">
                        <p>State</p><input v-model="user.state" class="input" type="text" title="state">
                    </div>
                    <div class="col-md-3">
                        <p>Zip Code</p><input v-model="user.zip" class="input" type="text" title="zipCode">
                    </div>
                </div>
                <div class="row prompt">
                    <div class="col-md-4">
                        <p>Date of Birth</p>
                        <input class="input" type="text" title="dataOfBirth">
                    </div>
                </div>
                <div class="row prompt">
                    <div class="col-md-6">
                        <p>Email</p>
                        <input class="input" v-model="user.email" type="text" title="email">
                    </div>
                    <div class="col-md-4">
                        <p>Phone Number</p>
                        <input class="input" v-model="user.phone" type="text" title="phoneNumber">
                    </div>
                </div>
                <div class="row prompt">
                    <div class="col-md-4">
                        <p>Credit Score</p>
                        <input class="input" type="text" title="creditScore" v-model="creditScore">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10">
                        <a role="button" href="javascript:void(0);" class="btn btn-primary form-control" @click="apply()">
                            APPLY
                        </a>
                    </div>
                </div>
            </form>
        </div>

        <div id="card" class="col-md-4 cardContainer">
            <h3 class="title" align="center">{{card.name}}</h3>
            <p><img class="cardImage" :src="card.image"
                    alt="Credit Card Image"></p>
            <ul class="text">
                <li v-for="f in card.features">{{f}}</li>
            </ul>
        </div>
    </div>
</article>
  <footer class="footer">
          <div class="container">
              <a href="">© 2018 Pusheen's Marketplace</a>
              </div>
      </footer>
</div>


</template>

<script>

const mes1 = `Congratualtions!You have successfully applied for $1. You will be notified for the next step as soon as we process your application.`
const mes2 = `We are sorry…Your application doesn’t seem like match the requiremnt of $1. Please feel free to look out to other credit cards on our webiste!`
import {retrieveCards, applyCard, cards, postUserData} from '../rv'
import Nav from '@/components/Nav'
import swal from 'sweetalert'
export default {
  name: 'Apply',

  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      creditScore: 0,
      card: cards[this.id],
      creditScore: 0,
      user: {
        first: "", mi: "", last: "",address: "", city: "",state: "",zip: "",state: "",
        email: "", phone: ""
      }
    }
  },

  components: {
    'pusheen-nav': Nav
  },

  props: ['id'],



  methods: {
    apply () {
      applyCard(this.card.id, parseInt(this.creditScore), (err, res) => {
        if (err) swal("Oops", err.message, "error")
        else {
            if (res.message.includes("fortun")) {
                swal("Oops",mes2.replace('$1', this.card.name),'error')
            } else {
                let u = JSON.parse(JSON.stringify(this.user))
                postUserData(u, (err, res) => {})
                this.$ga.event('card', 'buy', '' + this.card.id, 0)
                swal("Success",mes1.replace('$1', this.card.name),'success')
            }
        }
      })
    }
  }

}


</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,h2,h3,h4,h5,h6,p{
  font-family: Helvetica Neue;
}

h3.title{
    font-size: 18px;
    margin-top: 30px;
}

h2.title {
    font-size: 24px;
    margin-bottom: 20px;
}

ul{
    margin-top:30px;
    padding:5%;
}

a{
text-decoration:none;
}
a:hover{
    text-decoration: none;
}
article {
    width: 80%;
    margin: 2em auto 5em;
    font-family: "Helvetica Neue", sans-serif;
}
.title {
    font-weight: bold;
    font-size: 1.2em;
    line-height: 1.2em;
    margin-bottom: 1em;
    align-items: center;
}

.text {
    font-size: 0.9em;
}
.prompt {
    font-weight: bold;
}
.input {
    border-color: transparent transparent #878686 transparent;
    border-width: 1px;
    margin-bottom: 1.5em;
    font-weight: normal;
    width: 100%;
    outline: 0;
}

.cardContainer {
    box-shadow: 1px 1px 1px 1px #d3d3d3;
    height:800px;
}
.cardImage {
    display: block;
    border-radius: 10%;
    width: 70%;
    margin: 0 auto 1em;
}
.banner {
    width: 100%;
    background: #242942;
    color: #FFFFFF;
    line-height: 2.5em;
}
#form {
    margin-bottom: 1.5em;
}
.btn-primary{
    background-color:#FF8800;
    border-color: #FF8800;
    color:white;
    margin-top:30px;
    width:30%;
}
.btn-primary:focus{
    outline:0;
}
.btn-primary:not(:disabled):not(.disabled):active{
    background-color: #FF8800;
    border-color:#FF8800;
    box-shadow:none;

}
.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.focus, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:focus{
  border-color:#FF8800;
  outline:0;
}
.form-control:focus{
    box-shadow: none
}
footer{
    background-color:#242942;
    height: 80px;
    padding: 30px 0px;
    /*text-align: center;*/
    margin-top:70px;
}

.footer a{
    text-decoration: none;
    color:white;
    font-size: 15px;
}


.footer a:hover {
  color: lightgrey;
}
footer{
    text-align: center;
}
</style>
