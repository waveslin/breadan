<template>
  <div id="app">
    <nav id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/menu">Menu</router-link> | 
      <router-link to="/cart">
        <span> Cart </span>
        <span class="icon">
              <!-- <font-awesome-icon icon="shopping-basket" class="shopping-basket"/> -->
              <font-awesome-icon icon="shopping-bag" class="shopping-bag"/>
          </span>
      </router-link>
      
    </nav>
    <router-view/>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
  font-size: 24px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
  text-decoration: none;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
