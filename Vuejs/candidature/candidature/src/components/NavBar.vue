<template>
  <div id="nav">
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
      <div class="navbar-brand abs">Notes par plateforme</div>

      <div class="navbar-collapse collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <!-- <button type="button" class="btn btn-warning btn-circle">
              User
            </button> -->
             <a class="nav-link" href="#">User</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.navbar-brand.abs {
  position: absolute;
  width: 100%;
  left: 0;
  text-align: center;
}

.btn-circle {
  width: 70px;
  height: 70px;
  padding: 10px;
  border-radius: 35px;
  font-size: 24px;
  line-height: 1.33;
}
</style>
