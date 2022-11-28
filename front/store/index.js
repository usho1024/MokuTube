export const state = () => ({
  currentUser: null
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.currentUser = payload
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  }
}