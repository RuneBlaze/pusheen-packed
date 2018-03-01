<template>

<div>
  <pusheen-nav></pusheen-nav>

    <div class="container">
      <router-link to='/' style="color: gray">Back</router-link>
      <h2>{{card.name}}®</h2>

      <div class="row">
        <div class="col-md-4 ">
          <img v-bind:src="card.image" id="card_img">
          <router-link :to="{ name: 'apply', params: { id: id }}" role="button" class="btn btn-primary">Apply Now</router-link>
        </div>

        <div class="col-md-1"></div>

        <div class="col-md-7 ">
          <h5>Features</h5>


            <li v-for="feature in card.features">
              {{feature}}
            </li>

        </div>
      </div>

      <div class="table-responsive">
        <table class="table">
          <thead class="thead">
            <tr>
              <th scope="col-md-3">Intro APR</th>
              <th scope="col">Regular APR</th>
              <th scope="col">Rates and Fees</th>
              <th scope="col">Credits Recommended</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td scope="row">
                {{ card.intro_apr.rate}}% Intro APR for {{card.intro_apr.months }} months
              </td>
              <td>{{Math.round(card.regular_apr.rate*10000) / 100}}%</td>
              <td>
                ${{card.rates_and_fees[0].fee}} {{card.rates_and_fees[0].name}} fee
                <span v-if="card.rates_and_fees[1]">
                  ;<br>
                  {{Math.round(card.rates_and_fees[1].rate*10000) / 100}} Intro APR on
                  balance transfers for {{card.rates_and_fees[1].duration_months}} months
                </span>
              </td>
              <td>
                {{ card.recommended_credit_scores[0].name}}/{{card.recommended_credit_scores[1].name}}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

       <footer class="footer">
          <div class="container">
              <a href="">© 2018 Pusheen's Marketplace</a>
              </div>
      </footer>
  </div>

</template>

<script>
import {retrieveCards, applyCard, cards} from '../rv'
import Nav from '@/components/Nav'
export default {
  name: 'Card',

  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      creditScore: 0,
      card: cards[this.id],
    }
  },

  components: {
    'pusheen-nav': Nav
  },

  created() {
    this.$ga.ecommerce.addItem({
      id: this.card.id,                     // Transaction ID. Required.
      name: this.card.name,    // Product name. Required.
      sku: '',                 // SKU/code.
      category: 'Credit Card',         // Category or variation.
      price: '0.00',                 // Unit price.
      quantity: '1'                   // Quantity.
    })
  },

  props: ['id'],

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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/*****navbar set up ******/

/*main content*/
h1,h2,h3,h4,h5,h6,p{
  font-family: Helvetica Neue;
}
h2{
  font-size: 24px;
  margin-bottom: 20px;
}
h5{
  font-size: 18px;
}
a:hover{
text-decoration: none;
}
.thead {
  color:white;
  border-style: none;
  text-align: center;
  box-shadow: 5px;
}

thead{
  border:1px solid black;
}

th{
  color:white;
  background-color: #242942;
  border:1px solid black;
}

td {
  border: none;
  text-align: center;
  border:1px solid black;
}
.table td, .table th{
  vertical-align: middle;
}

button{
  margin-top: 20px;
  margin-bottom: 20px;
  background-color: #FF8800;
  border:0px;
  color:white;
  height: 50px;
  width: auto;
}
.btn-primary{
  background-color:#FF8800;
  margin-top:30px;
  border-color:#FF8800;
  padding:15px;
  float:left;
}


.btn-primary:focus{
    outline:0;
}
.btn-primary:not(:disabled):not(.disabled):active{
    background-color: #FF8800;
    border-color:#FF8800;

}
.btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.focus, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:focus{
  border-color:#FF8800;
  outline:0;
}
.form-control:focus{
    box-shadow: none
}
.btn-primary.focus, .btn-primary:focus{
  box-shadow: none;
}

.thead-dark{
  background-color: #242942;
}

#card_img{
  border-radius: 10%;
  max-width: 100%;
  max-height: 250px;
  min-width:350px;
}

#bottom{
  margin-top: 50px;
  height:70px;
  background-color: #242942;
}
.table{
  margin-top: 50px
}
footer{
    background-color:#242942;
    height: 80px;
    padding: 30px 0px;
    text-align: center;
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
</style>
