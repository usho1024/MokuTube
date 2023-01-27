<template>
  <v-text-field
    v-model="setName"
    :rules="rules"
    :counter="max"
    label="ユーザーネームを入力"
    placeholder="あなたの表示名"
    outlined
    class="mb-1"
    required
  />
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      max: 30,
      rules: [(v) => !!v || '', (v) => v.length <= this.max || ''],
    }
  },
  computed: {
    setName: {
      get() {
        return this.name
      },
      set(newVal) {
        return this.$emit('update:name', newVal)
      },
    },
  },
}
</script>
