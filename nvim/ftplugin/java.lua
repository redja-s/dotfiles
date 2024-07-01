-- Use this jdtl_bin for basic lsp configuration (i.e. no lombok etc.)
--local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
local lsp_attach = function(client, bufnr) end

-- ## Lombok setup
-- 1. Install lombok.jar and store it inside path below
local lombok_path = vim.fn.expand("$HOME/.local/share/java/lombok.jar")

-- ## Eclipse configuration setup
-- 1. Install eclipse.jdt.ls and point to the correct configuration (e.g. mac, windows, linux)
-- 2. Store the output of the tar file in $HOME/.local/share/java as required in the variables below
local os_map = {
  linux = "linux",
  mac = "mac",
  mac_arm = "mac_arm",
  win = "win",
}

local current_os = os_map.mac_arm
local os_config = vim.fn.expand("$HOME/.local/share/java/config_") .. current_os

-- ## Equinox launcher
-- 1. After installing and expanding the eclipse tar file, move the `plugins/` folder in $HOME/.local/share/java
local equinox_launcher = vim.fn.glob("$HOME/.local/share/java/plugins/org.eclipse.equinox.launcher_*.jar")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = {
    "java",

    "-javaagent:" .. lombok_path,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",

    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",

    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    equinox_launcher,

    "-configuration",
    os_config,

    "-data",
    project_name,
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      format = {
        settings = { url = vim.fn.expand("$HOME/.config/nvim/config/java-styleguide.xml") },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },
  on_attach = lsp_attach,
}

local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>jo", ":lua require'jdtls'.organize_imports()<cr>", { desc = "Organise imports", silent = true, buffer = bufnr })
vim.keymap.set("n", "<leader>jv", ":lua require'jdtls'.extract_variable()<cr>", { desc = "Extract variable", silent = true, buffer = bufnr })
vim.keymap.set("v", "<leader>jv", "<Esc>:lua require'jdtls'.extract_variable()<cr>", { desc = "Extract variable (visual)", silent = true, buffer = bufnr })
vim.keymap.set("n", "<leader>jc", ":lua require'jdtls'.extract_constant()<cr>", { desc = "Extract constant", silent = true, buffer = bufnr })
vim.keymap.set("v", "<leader>jc", "<Esc>:lua require'jdtls'.extract_constant()<cr>", { desc = "Extract constant (visual)", silent = true, buffer = bufnr })

-- Set shiftwidth and tabstop. This has higher priority than the formatting xml
-- See nvim-jdtls docs on GitHub for reference
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

require("jdtls").start_or_attach(config)
