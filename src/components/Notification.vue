<template>
    <div :class="[types[$notify.type],'shadow', 'rounded','notification',]" v-if="$notify.show">
      <h4>{{$notify.data.text}}</h4>
    </div>
</template>

<script setup lang='ts'>
  import { defineProps } from 'vue'
  import { useNotify } from '@/notification'

  const notify = useNotify()

  const types = {
    error: 'red',
    success: 'green',
    warning: 'yellow',
  }
</script>
<style>

.notification {
  position: absolute;
  bottom: 0;
  right: 0;
  display: flex;
  justify-self: center;
  justify-content: center;
  width: 400px;
  height: 70px;
  border-radius: 2px;
  justify-content: center;
  vertical-align: middle;
  padding: 13px;
  text-align: center;
  animation: alertIn 4s;
  transform: translateY(-20px)  translateX(-20px);
}
h4 {
  align-self: center;
}

.red {
  background-color: var(--bs-danger);
  color: white;
}

.green {
  background-color: var(--bs-success);
  color: white;
}

.yellow {
  background-color: var(--bs-warning);
  color: var(--bs-gray-700);
}

@keyframes alertIn {
  60% {opacity: 1;}
  100% {opacity: 0;} 
}
</style>