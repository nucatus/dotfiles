local java17_home = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/'
local jdtls_home = '/usr/local/Cellar/jdtls/1.20.0/libexec'
local jdtls_conf = jdtls_home .. '/config_mac'
local jdtls_plugin = jdtls_home .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'

local root_markers = {'.git', 'gradlew', 'mvnw', 'build.gradle'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = vim.fn.stdpath('data') .. '/eclipse-data/prejects/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    -- 'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    java17_home .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    -- '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version
    '-jar', jdtls_plugin,

    -- 💀
    -- '-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.
    '-configuration', jdtls_conf,

    -- 💀
    -- See `data directory configuration` section in the README
    -- '-data', '/path/to/unique/per/project/workspace/folder'
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
