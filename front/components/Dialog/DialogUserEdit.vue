<template>
  <v-dialog v-model="dialog" width="500">
    <template #activator="{ on }">
      <v-btn outlined color="indigo" dark v-on="on"
        ><v-icon class="mr-2">mdi-account-edit</v-icon
        >プロフィールを編集する</v-btn
      >
    </template>

    <v-card>
      <v-file-input
        v-model="inputFile"
        accept="image/png, image/jpeg"
        label="アバターイメージをアップロードする"
        chips
        show-size
        prepend-icon="mdi-camera"
      />
      <v-btn color="primary" :disabled="disabled" @click="updateUser">
        更新する
      </v-btn>

      <v-divider />

      <v-card-actions>
        <v-btn color="primary" text @click="dialog = false">閉じる</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    introduction: {
      type: String,
      default: null,
    },
  },
  data() {
    return {
      dialog: false,
      inputFile: null,
    }
  },
  computed: {
    disabled() {
      return !this.inputFile
    },
  },
  methods: {
    async updateUser() {
      const formData = new FormData()
      formData.append('user[avatar]', this.inputFile)
      await this.$axios
        .patch(`/api/v1/users/${this.currentUser.id}`, formData)
        .then((response) => {
          const user = {
            id: response.data.id,
            name: response.data.name,
            avatar: response.data.avatar,
          }
          this.$store.dispatch('getCurrentUser', user)
          this.inputFile = null
        })
    },
  },
}
</script>
