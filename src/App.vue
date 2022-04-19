<template>
    <h1>测试</h1>
    <h2>ubuntu</h2>
    <h3>新增测试</h3>
    {{data}}
    <!-- <div v-for="(item, index) in data" :key="index">
        <div> {{item.username}}</div>
        <div> {{item.password}}</div>
        <div> {{item.description}}</div>
        <hr>
    </div> -->
</template>

<script setup>
  import http from '@/request';
  import { ref, onMounted } from 'vue';
  const data = ref([])
  onMounted(() => {
    http.get('/user').then(res => {
      console.log(res, 'res');
      data.value = res.data
    })
  })
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
