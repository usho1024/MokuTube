import createPersistedState from 'vuex-persistedstate'

export default ({store}) => {
  createPersistedState({
    key: 'current-user',
    paths: [
      'currentUser'
    ]
  })(store)
}
