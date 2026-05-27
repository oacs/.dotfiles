return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    default_view = "body",
    default_env = "dev",
    debug = false,
    contenttypes = {
      ["application/json"] = {
        ft = "json",
        formatter = { "jq", "." },
      },
    },
  },
}
