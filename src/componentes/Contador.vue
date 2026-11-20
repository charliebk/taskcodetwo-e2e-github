<script setup lang="ts">
import { ref } from 'vue'
const cuenta = ref(0)
</script>

<template>
  <button type="button" @click="cuenta++">Pulsado {{ cuenta }} veces</button>
</template>
