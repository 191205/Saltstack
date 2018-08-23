#!/usr/bin/lua
require 'pl';
lfs = require 'lfs';
stringx.import();

---------
-- styles
pwd_color =  '%F{white}';
venv_glyph = '☇';
venv_color = '%F{blue}';
sigil_glyph_pts = '♯ %f'
sigil_glyph_tty = '# %f'
sigil_color = '%F{white}';
sigil_fail_color = '%F{red}';


---------
-- blocks
function pwd_block (n)
        if n == nil then n = 1 end

        -- get pwd or short-circuit
        local pwd = lfs.currentdir();
        if pwd == nil then return '??'; end
        
        -- get homedir-subbed PWD value
        local home = os.getenv('HOME');
        pwd = pwd:replace(home, '~', 1);

        -- determine if we're under the homedir
        local in_home = false;
        if pwd:startswith('~') then in_home = true; end

        -- determine if we should prefix ~ or /
        -- if the pwd includes the root/homedir
        local segments = pwd:split('/'):slice(2);
        local prefix = '';
        if segments:len() <= n then
                if in_home then
                        prefix = '~/';
                else
                        prefix = '/';
                end
        end

        return pwd_color .. prefix .. segments:slice(-n):join('/');
end


function venv_block ()
        local venv_path = os.getenv('VIRTUAL_ENV');
        if not venv_path then return '' end
        local _, _, venv_dir = stringx.rpartition(venv_path, '/');
        local venv_name, _, _ = stringx.rpartition(venv_dir, '-');
        return venv_color .. venv_glyph .. venv_name;
end


function sigil_block ()
        local last_status = os.getenv('LAST_STATUS');
        local term = os.getenv('TERM');
		local sigil_glyph;
        local color;
        if last_status == '0' then
                color = sigil_color;
        else
                color = sigil_fail_color;
        end
        if term:startswith('xterm') == true then
                sigil_glyph = sigil_glyph_pts;
        else
                sigil_glyph = sigil_glyph_tty;
        end

        return color .. sigil_glyph;
end


---------------------
-- compose the prompt

blocks = List {
        pwd_block(1),
        venv_block(),
        sigil_block(),
};
function notEmpty (val) return val ~= ''; end
blocks = blocks:filter(notEmpty);

io.write((' '):join(blocks));
