local picker = require('nickmorgan.plugins.picker');

vim.pack.add({
  picker,
},{
  load = function(plug)
    local data = plug.spec.data or {}
    local setup = data.setup

    vim.cmd.packadd(plug.spec.name)

    if setup ~= nil and type(setup) == 'function' then
      setup()
    end
  end
});
