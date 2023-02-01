export const state = () => ({
  currentUser: null,
  toast: {
    msgs: null,
    color: null,
    timeout: 4000,
  },
})

export const getters = {}

export const mutations = {
  setCurrentUser(state, payload) {
    state.currentUser = payload
  },
  setToast(state, payload) {
    state.toast = payload
  },
}

export const actions = {
  getCurrentUser({ commit }, currentUser) {
    commit('setCurrentUser', currentUser)
  },
  getToast({ commit }, { msgs, color, timeout }) {
    color = color || 'error'
    timeout = timeout || 4000
    commit('setToast', { msgs, color, timeout })
  },
}
