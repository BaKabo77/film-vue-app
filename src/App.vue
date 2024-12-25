<template>
  <navbar></navbar>
  <div class="container mb-3">
    <router-view></router-view>
  </div>
</template>

<script setup>
import navbar from './composants/navbar.vue';
</script>
