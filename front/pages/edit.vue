<template>
  <v-container>
    <v-row>
      <v-col
        cols="4"
      >
        <v-img
          :src="currentUser.avatar.url"
          max-height="300"
          max-width="300"
        />
      </v-col>
      <v-col
        cols="8"
      >
        <v-file-input
          v-model="inputFile"
          accept="image/png, image/jpeg"
          label="アバターイメージをアップロードする"
          chips
          show-size
          prepend-icon="mdi-camera"
          @change="setAvatar"
        />
        <v-btn
          color="primary"
          :disabled="disabled"
          @click="updateUser"
        >
        更新する
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    layout: 'logged-in',
    data(){
      return{
        inputFile: null,
      }
    },
    computed: {
      currentUser() {
        return this.$store.state.currentUser
      },
      disabled() {
        return !this.inputFile
      }
    },
    methods:{
      setAvatar(e){
        this.inputFile = e
      },
      updateUser(){
        const formData = new FormData()
        formData.append('user[avatar]', this.inputFile)
        const config = {
          headers: {
            'content-type': 'multipart/form-data',
          }
        }
        this.$axios.patch(
          `/api/v1/users/${this.currentUser.id}`,
          formData,
          config
        )
        .then(response => {
          this.inputFile = null
          const user = response.data
          this.$store.dispatch('getCurrentUser', user)
        })
      }
    }
  }
</script>
