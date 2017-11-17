<template>
  <div>
    <div class="error-message" v-html="message"></div>
    <div class="users-list">
        <div class="user-email header">Email</div>
        <div  class="user-created-at header">Created At</div>

      <div v-for="user in users">
        <div class="user-email">{{user.email}}</div>
        <div  class="user-created-at">created {{user.created_at}}</div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      users: {},
      message: ""
    }
  },
  methods: {
  },
  created() {
    axios.defaults.headers.common['Accept'] = 'application/json';
    axios.get('/api/users')
      .then(response =>
      this.users = response.data.users)
      .catch(error => {
        if (error.response.status == 401) {
          this.message = "please log in";
        } else if (error.response.data.errors){
          this.message = error.response.data.errors.join(" <br>")
        } else {
          this.message =  error.response.statusText;
        }
      })
  }
}
</script>

<style>
div.error-message {
  padding: 10px 0;
  font-weight: bold;
  min-height: 1em;
}

div.user-email, div.user-created-at {
  display: inline-block;
  min-width: 280px;
  padding: 5px 5px 5px 25px;
}

div.header {
  font-weight: bold;
  border-bottom: 1px solid #ccc
}
</style>
