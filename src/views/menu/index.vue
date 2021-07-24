<template>
    <section>
        <p>{{result}}</p>
        <input type='text' v-model='result' v-on:keyup.enter='checkEnter'>
        
    </section>
</template>

<script>

export default {
  name: "Menu",
  props: {
    /*...*/
  },
  components: {
    
  },
  data(){
    return {
      result : ''
    }
  },
  computed:{
    /*...*/
  },
  watch:{
    /*...*/
  },
  methods: {
    checkEnter : function(){
        console.log('Pressed Enter')
    }
  },
  created(){
    /*...*/
  },
  mounted(){
    /*...*/
  }
};
</script>


<style lang="scss" scoped>
    p{
        height: 40px;
        width: 200px;
        margin: 20px auto;
    };

    .shopping-basket{
        color: red;
    }
</style>