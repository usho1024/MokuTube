export const state = () => ({
  currentUser: null,
  chatMessages: null
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.currentUser = payload
  },
  setChatMessages (state, payload) {
    state.chatMessages = payload
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getChatMessages ({ commit }, message) {
    commit('setChatMessages', message)
  }
}
