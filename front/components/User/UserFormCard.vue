<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="3">
        <v-card class="pa-5">
          <slot name="user-form-card-content" />
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {}
</script>
