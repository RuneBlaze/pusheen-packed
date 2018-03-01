<template>
<div class="hello">
    <header id="home" class="bg-img">
        <nav class="navbar navbar-expand-sm navbar-inverse transparent" style="margin-bottom:20px;padding-top:10px;">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
               <a href=""><img src="../assets/pusheen_white_nobkg.png" style="max-width:100px; float:right;"></a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
<!--                         <li class="nav-item">
                            <router-link class="nav-link" to="/">Home</router-link>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" href="#findcards">Find a new credit card</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="tagline">
            <h1>Hey, Welcome to Pusheen’s Marketplace</h1>
        </div>
    </header>

    <section id="findcards">
        <div class="col-md-12 col-md-offset-1 col-centered">
            <div class="grids">
                <h2>Find the best credit card for you!</h2>
                <ul class="filter">
                    <div id="myBtnContainer">
                        <a class="btn" data-hover="All" @click="toggleTag('all')" v-bind:class="{active: includeMe_(['all'])}">
                  All</a>
                        <a class="btn" @click="toggleTag('0annualfee')" v-bind:class="{active: includeMe_(['0annualfee'])}">
                  0 annual fee</a>
                        <a class="btn" @click="toggleTag('cashback')" v-bind:class="{active: includeMe_(['cashback'])}">
                  Cash Back</a>
                        <a class="btn" @click="toggleTag('travel')" v-bind:class="{active: includeMe_(['travel'])}">
                  Travel and Airline</a>
                        <a class="btn" @click="toggleTag('highcredit')" v-bind:class="{active: includeMe_(['highcredit'])}">High Credit</a>
                        <a class="btn" @click="toggleTag('lowcredit')" v-bind:class="{active: includeMe_(['lowcredit'])}">Low Credit</a>
                    </div>
                </ul>
                <div class="container" id="allthecards">
                    <div class="filterDiv 0annualfee cashback highcredit" v-bind:class="{show: includeMe(['0annualfee','cashback','highcredit'])}" @mouseover="trackhover('americanExpressBlueCash')">
                        <figure class="block">
                            <img src="../img/americanExpressBlueCash.jpg" alt="" />
                            <figcaption>
                                <h3>American Express Blue Cash Everyday®</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp;-$150 statement credit after you spend $1,000 in purchases on your new Card within the first 3 months
                                    </br>&nbsp; &nbsp;-3% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%)
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 2 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv travel highcredit" v-bind:class="{show: includeMe(['travel','highcredit'])}" @mouseover="trackhover('americanExpressPlatinum')">
                        <figure class="block">
                            <img src="../img/americanExpressPlatinum.jpg" alt="" />
                            <figcaption>
                                <h3>American Express Platinum Card®</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn 60,000 Membership Rewards® points after you use your new Card to make $5,000 in purchases in your first 3 months.
                                    </br>&nbsp;&nbsp; -5X Membership Rewards® points on flights booked directly with airlines or with American Express Travel
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 7 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv travel highcredit" v-bind:class="{show: includeMe(['travel','highcredit'])}" @mouseover="trackhover('bankOfAmericaTravelRewards')">
                        <figure class="block">
                            <img src="../img/bankOfAmericaTravelRewards.jpg" alt="" />
                            <figcaption>
                                <h3>Bank of America® Travel Rewards Credit Card</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn unlimited 1.5 points per $1 spent on all purchases, with no foreign transaction fees and your points don't expire.
                                    </br>&nbsp; &nbsp; -20,000 online bonus points if you make at least $1,000 in purchases in the first 90 days of account opening
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 6 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv 0annualfee travel lowcredit" v-bind:class="{show: includeMe(['travel','0annualfee','lowcredit'])}" @mouseover="trackhover('capitalOneVenture')">
                        <figure class="block">
                            <img src="../img/capitalOneVenture.jpg" alt="" />
                            <figcaption>
                                <h3>Capital One® Venture®</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Unlimited 1.5% cash back on every purchase
                                    </br>&nbsp; &nbsp; -Earn a $150 Bonus after you spend $500 on purchases in your first 3 months from account opening
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 0 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv 0annualfee cashback highcredit" v-bind:class="{show: includeMe(['0annualfee','cashback','highcredit'])}" @mouseover="trackhover('chaseFreedomUnlimited')">
                        <figure class="block">
                            <img src="../img/chaseFreedomUnlimited.jpg" alt="" />
                            <figcaption>
                                <h3>Chase Freedom Unlimited®</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn 60,000 Membership Rewards® points after you use your new Card to make $5,000 in purchases in your first 3 months.
                                    </br>&nbsp;&nbsp; -5X Membership Rewards® points on flights booked directly with airlines or with American Express Travel
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 1 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv travel highcredit" v-bind:class="{show: includeMe(['travel','highcredit'])}" @mouseover="trackhover('chaseSapphirePreferred')">
                        <figure class="block">
                            <img src="../img/chaseSapphirePreferred.jpg" alt="" />
                            <figcaption>
                                <h3>Chase Sapphire Preferred® Card</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn unlimited 1.5 points per $1 spent on all purchases, with no foreign transaction fees and your points don't expire.
                                    </br>&nbsp; &nbsp; -20,000 online bonus points if you make at least $1,000 in purchases in the first 90 days of account opening
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 3 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv cashback 0annualfee highcredit" v-bind:class="{show: includeMe(['cashback','0annualfee','highcredit'])}" @mouseover="trackhover('citiDoubleCash')">
                        <figure class="block">
                            <img src="../img/citiDoubleCash.jpg" alt="" />
                            <figcaption>
                                <h3>Citi® Double Cash</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn 60,000 Membership Rewards® points after you use your new Card to make $5,000 in purchases in your first 3 months.
                                    </br>&nbsp;&nbsp; -5X Membership Rewards® points on flights booked directly with airlines or with American Express Travel
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 4 }}"></router-link>
                        </figure>
                    </div>
                    <div class="filterDiv cashback 0annualfee highcredit" v-bind:class="{show: includeMe(['cashback','0annualfee','highcredit'])}" @mouseover="trackhover('discoverItCashbackMatch')">
                        <figure class="block">
                            <img src="../img/discoverItCashbackMatch.jpg" alt="" />
                            <figcaption>
                                <h3>Discover it® Cashback Match™</h3>
                                <h5>Top features:</h5>
                                <p>&nbsp; &nbsp; -Earn unlimited 1.5 points per $1 spent on all purchases, with no foreign transaction fees and your points don't expire.
                                    </br>&nbsp; &nbsp; -20,000 online bonus points if you make at least $1,000 in purchases in the first 90 days of account opening
                                </p>
                                <h4>Lean more &#8594</h4>
                            </figcaption>
                            <router-link :to="{ name: 'card', params: { id: 5 }}"></router-link>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
        
    </section>

    <div class="">
        
          <footer class="footer">
          <div class="container">
              <a href="">© 2018 Pusheen's Marketplace</a>
              </div>
      </footer>
        
    </div>

    
</div>

</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      currentTags: ['all'],
    }
  },
  methods: {
    toggleTag(str) {
      this.$ga.event('category', 'toggle', str, 0)
      if (this.currentTags.includes(str)) {
        if (this.currentTags.length === 1) {
          return
        }
        this.currentTags = this.currentTags.filter(it => it != str)
      } else {
        if (str === 'all') {
          this.currentTags = []
        } else if (this.currentTags.includes('all')) {
          this.currentTags = this.currentTags.filter(it => it != 'all')
        }

        if (str === 'highcredit') {
          this.currentTags = this.currentTags.filter(it => it != 'lowcredit')
        }
        if (str === 'lowcredit') {
          this.currentTags = this.currentTags.filter(it => it != 'highcredit')
        }
        this.currentTags.push(str)
        // FIXME: sudden feature change, just hack it first
        this.currentTags = [this.currentTags[this.currentTags.length - 1]]
      }
    },

    trackhover(str) {
      this.$ga.event('cards', 'hover', str, 0)
    },

    includeMe(arr) {
      if (this.currentTags.includes('all')) return true
      return arr.filter(it => this.currentTags.includes(it))[0]
    },

    includeMe_(arr) {
      return arr.filter(it => this.currentTags.includes(it))[0]
    }
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

/*****Global Style ******/
h1,h2,h3,h4,h5,h6,p{
  font-family: Helvetica Neue;
}
/*****navbar set up ******/
.navbar-header{
  padding-bottom: 10px;
}

.navbar-img{
  max-width: 200px;
  position: relative;
}

.navbar-inverse{
  background-color: transparent;
  border-color:transparent;
  width:80%;
  margin:auto;
}

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form{
  margin-top:12px;
}

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form{
  border-style: none;
}

.nav.navbar-nav li a {
   color: white;
   font-size: 20px;
   line-height: 1.6em;
   text-align: center;
 }

 .navbar-toggle {
  margin-top: 15px;
}
.nav.navbar-nav li a:hover{
  color:#242942;
}
.nav.navbar-nav li a:active{
  color:#242942;
}
.nav.navbar-nav li a:focus{
  color:#242942;
}


/***background image****/
#home.bg-img{
  background: url(../img/home.jpg) no-repeat center center fixed;
  box-shadow: inset 0 0 0 800px rgba(255,136,0,.85);
  height: 800px;
    background-repeat: no-repeat;
    background-size: auto;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
.tagline{
  height: 1400px;
}
.tagline h1{
   color: white;
   font-family: Helvetica Neue;
   font-size: 40px;
   margin-top:0;
   text-align: center;
   padding-top:20%;
}


/****find my credit cards****/
.grids h2{
  font-size:28px;
  color:#242942;
  text-align: center;
  margin-top:130px;
  margin-bottom:30px;
}


.filter .container {
    overflow: hidden;
    margin-bottom: 50px;
}
.container{
  max-width: 1200px !important;
}

.filterDiv {
    /*float: left;*/
    /*display: none;  Hidden by default */
    display: none;
    flex-basis: 20px;
}

/* The "show" class is added to the filtered elements */
.show {
  /*display:block;*/
    display: block;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: none;
  cursor: pointer;
  color:#242942;;
  font-size: 16px;
  text-transform: uppercase;
}

/* Add a light grey background on mouse-over */
.btn:hover {
/*  background-color: #ddd;*/
}

/* Add a dark background to the active button */
.btn.active {
  color:#FF8800;
}
.btn.active, .btn:active{
  box-shadow: none;
  border:none;
}
.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus{
  border:none;
  outline:0;
}


.filter {
  text-align: center;
  text-transform: uppercase;
  font-weight: 500;
  margin-bottom:30px;
}
.filter * {
  box-sizing: border-box;
}
.filter a {
  display: inline-block;
  list-style: outside none none;
  margin: 0 1.5em;
  padding: 0;
}
.filter a {
  padding: 0.6em 0;
  color: #242942;
  position: relative;
  letter-spacing: 1px;
  text-decoration: none;
}
.filter a:before,
.filter a:after {
  position: absolute;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.filter a:before {
  bottom: 0;
  display: block;
  height: 3px;
  width: 0%;
  content: "";
  background-color:#FF8800;
}
.filter a:after {
  left: 0;
  top: 0;
  padding: 0.5em 0;
  position: absolute;
  content: attr(data-hover);
  color: #FF8800;
  white-space: nowrap;
  max-width: 0%;
  overflow: hidden;
}

.filter a:hover {
  color: #FF8800;
}

.filter a:hover:before,
.filter .current button:before {
  opacity: 1;
  width: 100%;
}
.filger button:hover:after,
.filter .current button:after {
  max-width: 100%;
}

.grids img{
  border-radius: 10%;
}

.block {
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 15px;
  min-width: 350px;
  max-width: 350px;
  height:240px;
  width: 100%;
  background-color: #000000;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  border-radius: 10%;
}
.block * {
  -webkit-transition: all 0.35s;
  transition: all 0.35s;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.block img {
  width:350px;
  height:240px;
  vertical-align: top;
}
.block figcaption {
  position: absolute;
  height: 49px;
  bottom: 0px;
  overflow: hidden;
  padding: 15px;
  padding-top:5px;
  background-color: rgba(0, 0, 0, 0.75);
}
.block h3 {
  font-size: 15px;
  font-weight: 400;
  line-height: 24px;
  margin: 10px 0;
}
.block h4{
  color:#FF8800;
  float:right;
  font-size:15px;
}
.block h5 {
  font-weight: 400;
  margin: 0;
  font-size:13px;
  color: #FF8800;
  letter-spacing: 1px;
  margin-bottom: 2px
}
.block p{
  font-size:15px;
}
.block a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
.block:hover figcaption,
.block.hover figcaption {
  height: calc(100%);

}

/****footer setup****/
.footer{
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
.col-md-12{
  padding:0;
}
.navbar-collapse{
  flex-grow:0;
}
.navbar-nav{
  padding-left: 50px;
}

.nav-link  {
  color: white;
}

nav {
  padding-top: 1em;
}

 .navbar.transparent.navbar-inverse .navbar-inner {
    border-width: 0px;
    -webkit-box-shadow: 0px 0px;
    box-shadow: 0px 0px;
    background-color: rgba(0,0,0,0.0);
    background-image: -webkit-gradient(linear, 50.00% 0.00%, 50.00% 100.00%, color-stop( 0% , rgba(0,0,0,0.00)),color-stop( 100% , rgba(0,0,0,0.00)));
    background-image: -webkit-linear-gradient(270deg,rgba(0,0,0,0.00) 0%,rgba(0,0,0,0.00) 100%);
    background-image: linear-gradient(180deg,rgba(0,0,0,0.00) 0%,rgba(0,0,0,0.00) 100%);
}

#allthecards {
  flex-direction: row;
  flex-wrap: wrap;
  display: flex;
}


/* Sticky footer styles
-------------------------------------------------- */
html {
  position: relative;
  min-height: 100%;
}
body {
  /* Margin bottom by footer height */
  /*flex-direction: column;*/
  margin-bottom: 60px;
}


</style>
