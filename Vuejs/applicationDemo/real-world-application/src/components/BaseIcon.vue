<template>
  <div class="icon-wrapper">
    <users-icon :size="size" class="custom-class"></users-icon>
      <slot name="label"></slot>
  </div>

</template>

<script>
import { UsersIcon } from 'vue-feather-icons';

export default {
  components: {
    UsersIcon
  },
  props: {
    size: {
      type: String,
      default: '1.5x'
    }
  }
};
</script>

<style scoped>
.icon-wrapper {
  display: inline-flex;
  /* align-items: center; */
  color: rgba(0, 0, 0, 0.4);
  font-size: 1rem;
  font-weight: 600;
}
.custom-class {
  stroke: currentColor;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  fill: none;
  margin-right: 6px;
}
</style>
