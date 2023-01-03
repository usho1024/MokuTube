<template>
  <v-container
    class="pa-0"
  >
    <v-row
      justify="center"
      no-gutters
    >
      <v-col
        cols="6"
      >
        <v-card
          class="pa-5"
        >
          <v-row>
            <v-col
              cols="3"
            >
              <v-img
                :src="currentUser.avatar.url"
                max-height="200"
                max-width="200"
              />
            </v-col>
            <v-col
              cols="9"
            >
              <v-file-input
                v-model="inputFile"
                accept="image/png, image/jpeg"
                label="アバターイメージをアップロードする"
                chips
                show-size
                prepend-icon="mdi-camera"
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
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'Edit',
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
      updateUser(){
        const formData = new FormData()
        formData.append('user[avatar]', this.inputFile)
        this.$axios.patch(`/api/v1/users/${this.currentUser.id}`, formData)
        .then(response => {
          const user = {
            id: response.data.id,
            name: response.data.name,
            avatar: response.data.avatar
          }
          this.$store.dispatch('getCurrentUser', user)
          this.inputFile = null
        })
      }
    }
  }
</script>
