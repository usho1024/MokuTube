<template>
  <v-dialog v-model="dialog" width="30%">
    <template #activator="{ on }">
      <v-btn outlined color="indigo" v-on="on"
        ><v-icon class="mr-2">mdi-account-edit</v-icon
        >プロフィールを編集する</v-btn
      >
    </template>

    <v-card>
      <v-subheader>プロフィールを編集</v-subheader>

      <v-divider />

      <v-sheet class="pa-5">
        <v-form>
          <v-text-field
            v-model="name"
            counter="30"
            label="ユーザーネーム"
            class="mb-5"
          ></v-text-field>
          <v-textarea
            v-model="introduction"
            counter="300"
            label="自己紹介文"
            class="mb-5"
          ></v-textarea>
          <v-text-field
            v-model="work"
            counter="30"
            label="作業内容"
            class="mb-5"
          ></v-text-field>
          <v-file-input
            v-model="inputFile"
            accept="image/png, image/jpeg"
            label="アバターイメージをアップロードする"
            chips
            show-size
            prepend-icon="mdi-camera"
          />
        </v-form>
      </v-sheet>

      <v-divider />

      <v-card-actions>
        <v-btn color="primary" width="100" class="mr-3" @click="updateUser">
          更新する
        </v-btn>
        <v-btn color="primary" text width="100" @click="dialog = false"
          >閉じる</v-btn
        >
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      dialog: false,
      name: this.user.name,
      introduction: this.user.introduction,
      work: this.user.work,
      inputFile: null,
    }
  },
  methods: {
    async updateUser() {
      const formData = new FormData()
      formData.append('user[name]', this.name)
      formData.append('user[introduction]', this.introduction)
      formData.append('user[work]', this.work)
      if (this.inputFile) {
        formData.append('user[avatar]', this.inputFile)
      }
      await this.$axios
        .patch(`/api/v1/users/${this.user.id}`, formData)
        .then((response) => {
          this.$emit('update:user', response.data)
          const user = {
            id: response.data.id,
            name: response.data.name,
            avatar: response.data.avatar,
          }
          this.$store.dispatch('getCurrentUser', user)
          this.inputFile = null
          this.dialog = false
        })
    },
  },
}
</script>
