import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/Login'
import Home from '@/home'
Vue.use(Router)
const originalPush = Router.prototype.push

Router.prototype.push = function push (location) {
return originalPush.call(this, location).catch(err => err)
}
const router =new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/Home',
      children: [
          {path: '/kb',name: 'kb',component: function () {return import('../kb.vue')}},
          {path: '/cygl',name: 'cygl',component: function () {return import('../cygl.vue')}},
          {path: '/xmgl',name: 'xmgl',component: function () {return import('../xmgl.vue')}},
          {path: '/jd',name: 'jd',component: function () {return import('../jd.vue')}},
          {path: '/xqwj',name: 'xqwj',component: function () {return import('../xqwj.vue')}},
          {path: '/xqtm',name: 'xqtm',component: function () {return import('../xqtm.vue')}},
          {path: '/xqyz',name: 'xqyz',component: function () {return import('../xqyz.vue')}},
          {path: '/wdqx',name: 'wdqx',component: function () {return import('../wdqx.vue')}},
          {path: '/fqqx',name: 'fqqx',component: function () {return import('../fqqx.vue')}},
          {path: '/csyl',name: 'csyl',component: function () {return import('../csyl.vue')}},
          {path: '/cstm',name: 'cstm',component: function () {return import('../cstm.vue')}},
    ],
      ///:account/:pwd
      name: 'Home',
      component: Home,
      props:true
    },
    {path: "*", redirect: "/"}
  ]
})

router.beforeEach((to,from,next) => {
        if (to.name !== 'Login'&&localStorage.getItem('userId')==null) next({ name: 'Login' })
        // 如果用户未能验证身份，则 `next` 会被调用两次
        next()
}) 
export default router;