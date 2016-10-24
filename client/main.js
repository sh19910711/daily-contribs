import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

const routes = [
  {path: '/', component: require('./pages/index.vue')}
];
const router = new VueRouter({routes, mode: 'history'});

window.onload = _ => {
  console.debug('hello client');
  new Vue({router}).$mount('#app');
};
