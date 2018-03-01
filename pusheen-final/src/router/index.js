import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Card from '@/components/Card'
import Apply from '@/components/Apply'

import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/index',
      name: 'HelloWorld',
      component: HelloWorld
    },
    { path: '/card/:id', name: 'card', component: Card, props: true},
    { path: '/apply/:id', name: 'apply', component: Apply, props: true},
  ]
})
