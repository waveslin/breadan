import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/home/index.vue';
import Menu from '../views/menu/index.vue';
import Cart from '../views/cart/index.vue';
import Item from '../views/item/index.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/item',
    name: 'Item',
    component: Item
  },
  {
    path: '/menu',
    name: 'Menu',
    component: Menu
  },
  {
    path: '/cart',
    name: 'Cart',
    component: Cart
  }
];

const router = new VueRouter({
  routes
});

export default router;
