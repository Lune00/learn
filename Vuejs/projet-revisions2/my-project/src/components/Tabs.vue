<template>
<div id="Tabs">
  <span class="tab" :class="{activeTab: selectedTab === tab}" v-for="(tab,index) in tabs" :key="index" @click="selectedTab = tab">{{tab}}</span>

  <div v-if="selectedTab === 'Tab1'">Tab 1 Content</div>
  <div v-if="selectedTab === 'Tab2'">Tab 2 Content</div>
  <div v-if="selectedTab === 'Tab3'">Tab 3 Content</div>

</div>
</template>
<script>
export default {
  name: "Tabs",
  data: () => ({
    tabs: ['Tab1', 'Tab2', 'Tab3'],
    selectedTab: 'Tab1'
  })
}
</script>
<style lang="css" scoped>

.tab{
  margin-left: 20px;
  cursor: pointer;
}
.activeTab{
  text-decoration: underline;
}
</style>
