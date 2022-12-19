<template>
 <div>
  <v-file-input
   accept="image/png, image/jpeg, image/bmp"
   label="画像"
   @change="setImage"
  />
  <v-btn
   @click="createPost"
  >
  投稿する
  </v-btn>
 </div>
</template>

<script>
 export default {
  data(){
   return{
    image:""
   }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    }
  },
  methods:{
   setImage(e){
    this.image = e;
   },
   createPost(){
    const formData = new FormData();
    formData.append("image", this.image);
    const config = {
     headers: {
      "content-type": "multipart/form-data",
     }
    };
    this.$axios.patch(`"/api/v1/users/${this.currentUser.id}"`,
     formData,config
    )
    // 成功時の処理
    .then(res => {
    })
    // // 失敗時の処理
    // .catch((error) => {
    // })
   }
  }
 }
</script>
