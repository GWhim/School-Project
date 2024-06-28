// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import axios from 'axios'
import VueAxios from 'vue-axios'
import 'element-ui/lib/theme-chalk/index.css';
import './assets/css/global.css';
import global from './assets/js/global.js';
import $ from 'jquery';

window.jQuery = $;
window.$ = $;
Vue.prototype.$axios=axios
axios.defaults.baseURL = '/api'

Vue.config.productionTip = false
Vue.prototype.$getUser=global.methods.getUser;
Vue.prototype.$dateFormat=global.methods.dateFormat;
Vue.use(axios)
Vue.use(ElementUI)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

