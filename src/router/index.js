import Vue from 'vue'
import Router from 'vue-router'
import HashGenerator from '@/components/HashGenerator'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HashGenerator',
      component: HashGenerator
    }
  ]
})
