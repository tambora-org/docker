// see https://vuejs.github.io/eslint-plugin-vue/rules/

module.exports = {
  extends: [
    // add more generic rulesets here, such as:
    // 'eslint:recommended',
    'plugin:vue/recommended'
  ],
  rules: {
    // override/add rules settings here, such as:
    // 'vue/no-unused-vars': 'error'
    "vue/v-bind-style": ["error", "longform"]
  }
}
